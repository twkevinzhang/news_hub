import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/sidecar/bloc/sidecar_logs_cubit.dart';

/// Sidecar 日誌查看頁面
///
/// 顯示即時串流日誌，支援搜尋、匯出、清除與自動滾動功能。
/// 遵循 Material Design 3 規範與 BLoC 模式。
@RoutePage()
class SidecarLogsScreen extends StatefulWidget {
  /// 建構子
  const SidecarLogsScreen({super.key});

  @override
  State<SidecarLogsScreen> createState() => _SidecarLogsScreenState();
}

class _SidecarLogsScreenState extends State<SidecarLogsScreen> {
  final ScrollController _scrollController = ScrollController();
  late final SidecarLogsCubit _cubit;
  final _preferences = sl<SidecarPreferences>();
  bool _autoScroll = true;

  @override
  void initState() {
    super.initState();
    _cubit = sl<SidecarLogsCubit>();
    _cubit.startWatching();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final autoScroll = await _preferences.autoScroll.get();
    if (mounted) {
      setState(() {
        _autoScroll = autoScroll;
      });
    }
  }

  /// 獲取日誌等級對應的顏色
  Color _getLevelColor(LogLevel? level) {
    switch (level) {
      case LogLevel.debug:
        return Colors.grey;
      case LogLevel.info:
        return Colors.blue;
      case LogLevel.warn:
        return Colors.orange;
      case LogLevel.error:
        return Colors.red;
      case LogLevel.critical:
        return Colors.purple;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<SidecarLogsCubit, SidecarLogsState>(
        listener: (context, state) {
          // 處理匯出成功提示
          if (state.exportSuccess && state.exportPath != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('日誌已匯出至：${state.exportPath}'),
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(
                  label: '確定',
                  onPressed: () {},
                ),
              ),
            );
          }

          // 處理錯誤提示
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('錯誤：${state.error}'),
                backgroundColor: Theme.of(context).colorScheme.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }

          // 自動滾動邏輯
          if (_autoScroll && _scrollController.hasClients && state.logs.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                );
              }
            });
          }
        },
        child: BlocBuilder<SidecarLogsCubit, SidecarLogsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: state.isSearching
                    ? TextField(
                        autofocus: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: '搜尋日誌內容或 Logger...',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                        onChanged: (query) => _cubit.setSearchQuery(query),
                      )
                    : const Text('Sidecar Logs'),
                actions: [
                  if (state.isSearching)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => _cubit.toggleSearch(),
                    )
                  else
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () => _cubit.toggleSearch(),
                    ),
                  IconButton(
                    icon: const Icon(Icons.delete_sweep_outlined),
                    onPressed: () => _showClearConfirmDialog(context),
                    tooltip: '清除當前日誌',
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: state.filteredLogs.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.article_outlined,
                                  size: 48,
                                  color: Theme.of(context).disabledColor,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  state.searchQuery.isNotEmpty ? '找不到匹配的日誌' : '目前尚無日誌...',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            controller: _scrollController,
                            padding: const EdgeInsets.all(8),
                            itemCount: state.filteredLogs.length,
                            separatorBuilder: (context, index) => const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final log = state.filteredLogs[index];
                              final time = log.timestamp;
                              final timeStr =
                                  '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}';

                              return _LogEntryTile(
                                log: log,
                                timeStr: timeStr,
                                color: _getLevelColor(log.level),
                              );
                            },
                          ),
                  ),
                  _BottomStatusBar(
                    autoScroll: _autoScroll,
                    logCount: state.filteredLogs.length,
                    onAutoScrollChanged: (value) async {
                      await _preferences.autoScroll.set(value);
                      setState(() {
                        _autoScroll = value;
                      });
                    },
                  ),
                ],
              ),
              floatingActionButton: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.small(
                    heroTag: 'export_logs',
                    onPressed: () => _cubit.exportLogsToJson(),
                    tooltip: '匯出日誌 (JSON)',
                    child: const Icon(Icons.download_outlined),
                  ),
                  const SizedBox(height: 16),
                  FloatingActionButton(
                    heroTag: 'search_toggle',
                    onPressed: () => _cubit.toggleSearch(),
                    tooltip: '搜尋日誌',
                    child: Icon(state.isSearching ? Icons.search_off : Icons.search),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showClearConfirmDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('清除日誌'),
        content: const Text('您確定要清除目前顯示的所有日誌嗎？這不會影響 Sidecar 後端的日誌檔案。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('清除'),
          ),
        ],
      ),
    );

    if (result == true && mounted) {
      _cubit.clearLogs();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

/// 個別日誌條目的 Widget
class _LogEntryTile extends StatelessWidget {
  final LogEntry log;
  final String timeStr;
  final Color color;

  const _LogEntryTile({
    required this.log,
    required this.timeStr,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showLogDetail(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: color.withOpacity(0.5)),
                  ),
                  child: Text(
                    log.level.name.toUpperCase(),
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  timeStr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontFamily: 'monospace',
                      ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    log.loggerName,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              log.message,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
              ),
            ),
            if (log.exception.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  log.exception,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 11,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showLogDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        expand: false,
        builder: (context, scrollController) => ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          children: [
            Text('日誌詳情', style: Theme.of(context).textTheme.headlineSmall),
            const Divider(),
            _DetailItem(label: '時間', value: log.timestamp.toString()),
            _DetailItem(label: '等級', value: log.level.name.toUpperCase()),
            _DetailItem(label: 'Logger', value: log.loggerName),
            const SizedBox(height: 16),
            const Text('訊息内容：', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(log.message, style: const TextStyle(fontFamily: 'monospace')),
            ),
            if (log.exception.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text('異常堆棧：', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(log.exception, style: TextStyle(fontFamily: 'monospace', color: Theme.of(context).colorScheme.onErrorContainer)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 80, child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

/// 底部狀態與工具列
class _BottomStatusBar extends StatelessWidget {
  final bool autoScroll;
  final int logCount;
  final ValueChanged<bool> onAutoScrollChanged;

  const _BottomStatusBar({
    required this.autoScroll,
    required this.logCount,
    required this.onAutoScrollChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        children: [
          Text(
            '日誌條數: $logCount',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          Text(
            '自動滾動',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Switch.adaptive(
            value: autoScroll,
            onChanged: onAutoScrollChanged,
          ),
        ],
      ),
    );
  }
}
