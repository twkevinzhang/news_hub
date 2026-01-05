import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/system-operations/monitor-sidecar/sidecar_logs_cubit.dart';

@RoutePage()
class SidecarLogsScreen extends StatefulWidget {
  const SidecarLogsScreen({super.key});

  @override
  State<SidecarLogsScreen> createState() => _SidecarLogsScreenState();
}

class _SidecarLogsScreenState extends State<SidecarLogsScreen> {
  final ScrollController _scrollController = ScrollController();
  late final SidecarLogsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = sl<SidecarLogsCubit>();
    _cubit.startWatching();
  }

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

          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('錯誤：${state.error}'),
                backgroundColor: Theme.of(context).colorScheme.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
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
                  _StatusBar(
                    autoScroll: state.autoScroll,
                    logCount: state.filteredLogs.length,
                    onAutoScrollChanged: (value) {
                      _cubit.toggleAutoScroll(value);
                    },
                  ),
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
                        : AutoScrollListView<LogEntry>(
                            controller: _scrollController,
                            items: state.filteredLogs,
                            autoScroll: state.autoScroll,
                            onAutoScrollChanged: (enabled) => _cubit.toggleAutoScroll(enabled),
                            itemBuilder: (context, log) {
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
                    heroTag: 'retry_connection',
                    onPressed: state.isReconnectable ? () => _cubit.retryConnection() : null,
                    tooltip: state.isReconnectable ? '重試連線' : (state.isConnected ? '連線正常' : '連線中...'),
                    backgroundColor: state.isConnected
                        ? Theme.of(context).colorScheme.surfaceContainerHighest
                        : (state.isReconnectable ? Theme.of(context).colorScheme.errorContainer : Theme.of(context).colorScheme.surfaceContainerHighest),
                    foregroundColor: state.isConnected
                        ? Theme.of(context).disabledColor
                        : (state.isReconnectable ? Theme.of(context).colorScheme.onErrorContainer : Theme.of(context).disabledColor),
                    child: const Icon(Icons.refresh),
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

class _StatusBar extends StatelessWidget {
  final bool autoScroll;
  final int logCount;
  final ValueChanged<bool> onAutoScrollChanged;

  const _StatusBar({
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
        border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
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

class AutoScrollListView<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final ScrollController controller;
  final bool autoScroll;
  final ValueChanged<bool> onAutoScrollChanged;

  const AutoScrollListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.controller,
    required this.autoScroll,
    required this.onAutoScrollChanged,
  });

  @override
  State<AutoScrollListView<T>> createState() => _AutoScrollListViewState<T>();
}

class _AutoScrollListViewState<T> extends State<AutoScrollListView<T>> {
  bool _isUserInteracting = false;
  static const double _bottomThreshold = 50.0;

  // Track previous item count to detect additions
  late int _previousItemCount;

  @override
  void initState() {
    super.initState();
    _previousItemCount = widget.items.length;
  }

  @override
  void didUpdateWidget(AutoScrollListView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if new items were added
    if (widget.items.length > _previousItemCount) {
      // Trigger scroll if autoScroll is enabled AND user is NOT interacting
      if (widget.autoScroll && !_isUserInteracting) {
        _scrollToBottom();
      }
    }
    _previousItemCount = widget.items.length;

    // Also handle case where autoScroll was just enabled manually
    if (widget.autoScroll && !oldWidget.autoScroll && !_isUserInteracting) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.controller.hasClients) {
        widget.controller.animateTo(
          widget.controller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  bool _isNearBottom(ScrollMetrics metrics) {
    // Check if we are close to the bottom
    return metrics.extentAfter < _bottomThreshold;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _isUserInteracting = true,
      onPointerUp: (_) {
        _isUserInteracting = false;
        // If user let go and we are at the bottom, re-enable auto scroll
        // BUT ONLY if we are truly at/near the bottom.
        if (widget.controller.hasClients && !widget.autoScroll && _isNearBottom(widget.controller.position)) {
          widget.onAutoScrollChanged(true);
        }
      },
      onPointerCancel: (_) => _isUserInteracting = false,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            // User dragging content down (finger moves down, content moves down to show top) -> Offset decreases -> Delta < 0
            if (_isUserInteracting && notification.scrollDelta != null && notification.scrollDelta! < 0 && !_isNearBottom(notification.metrics)) {
              if (widget.autoScroll) {
                widget.onAutoScrollChanged(false);
              }
            }
          }

          // Double check on end of scroll
          if (notification is ScrollEndNotification) {
            if (_isNearBottom(notification.metrics)) {
              if (!widget.autoScroll) widget.onAutoScrollChanged(true);
            }
          }
          return false;
        },
        child: ListView.separated(
          controller: widget.controller,
          padding: const EdgeInsets.all(8),
          itemCount: widget.items.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) => widget.itemBuilder(context, widget.items[index]),
        ),
      ),
    );
  }
}
