import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/sidecar/bloc/sidecar_logs_cubit.dart';

/// Sidecar 管理與設定頁面
///
/// 允許使用者設定日誌等級、最大日誌條數等參數。
/// 遵循 Material Design 3 規範，使用 M3 組件。
@RoutePage()
class SidecarManageScreen extends StatelessWidget {
  /// 建構子
  const SidecarManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sidecar 設定'),
      ),
      body: ListView(
        children: const [
          _LogLevelSetting(),
          Divider(),
          _MaxLogEntriesSetting(),
          Divider(),
          _AutoScrollSetting(),
        ],
      ),
    );
  }
}

/// 日誌等級設定項目
class _LogLevelSetting extends StatefulWidget {
  const _LogLevelSetting();

  @override
  State<_LogLevelSetting> createState() => _LogLevelSettingState();
}

class _LogLevelSettingState extends State<_LogLevelSetting> {
  final _preferences = sl<SidecarPreferences>();
  String? _currentLevel;

  @override
  void initState() {
    super.initState();
    _loadLevel();
  }

  Future<void> _loadLevel() async {
    final level = await _preferences.logLevel.get();
    if (mounted) {
      setState(() {
        _currentLevel = level;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.bug_report_outlined),
      title: const Text('日誌等級'),
      subtitle: const Text('設定顯示日誌的最低詳細度。選擇 DEBUG 會顯示最詳盡的資訊。'),
      trailing: _currentLevel == null
          ? const CircularProgressIndicator.adaptive()
          : DropdownButton<String>(
              value: _currentLevel,
              underline: const SizedBox(),
              items: ['DEBUG', 'INFO', 'WARN', 'ERROR', 'CRITICAL']
                  .map((level) => DropdownMenuItem(
                        value: level,
                        child: Text(level),
                      ))
                  .toList(),
              onChanged: (newLevel) async {
                if (newLevel != null) {
                  await _preferences.logLevel.set(newLevel);
                  setState(() {
                    _currentLevel = newLevel;
                  });
                  // 觸發日誌流重啟以應用新等級設定
                  if (sl.isRegistered<SidecarLogsCubit>()) {
                    sl<SidecarLogsCubit>().restartWithNewLevel();
                  }
                }
              },
            ),
    );
  }
}

/// 最大日誌條數設定項目
class _MaxLogEntriesSetting extends StatefulWidget {
  const _MaxLogEntriesSetting();

  @override
  State<_MaxLogEntriesSetting> createState() => _MaxLogEntriesSettingState();
}

class _MaxLogEntriesSettingState extends State<_MaxLogEntriesSetting> {
  final _preferences = sl<SidecarPreferences>();
  int? _currentMax;

  @override
  void initState() {
    super.initState();
    _loadMax();
  }

  Future<void> _loadMax() async {
    final max = await _preferences.maxLogEntries.get();
    if (mounted) {
      setState(() {
        _currentMax = max;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentMax == null) {
      return const ListTile(
        title: Text('最大日誌條數'),
        trailing: CircularProgressIndicator.adaptive(),
      );
    }

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.format_list_numbered_outlined),
          title: const Text('最大日誌條數'),
          subtitle: Text('記憶體中保留的日誌最大條數。目前：$_currentMax'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Slider(
            value: _currentMax!.toDouble(),
            min: 100,
            max: 5000,
            divisions: 49,
            label: '$_currentMax',
            onChanged: (value) {
              setState(() {
                _currentMax = value.toInt();
              });
            },
            onChangeEnd: (value) async {
              await _preferences.maxLogEntries.set(value.toInt());
            },
          ),
        ),
      ],
    );
  }
}

/// 自動滾動預設設定項目
class _AutoScrollSetting extends StatefulWidget {
  const _AutoScrollSetting();

  @override
  State<_AutoScrollSetting> createState() => _AutoScrollSettingState();
}

class _AutoScrollSettingState extends State<_AutoScrollSetting> {
  final _preferences = sl<SidecarPreferences>();
  bool? _isAutoScroll;

  @override
  void initState() {
    super.initState();
    _loadAutoScroll();
  }

  Future<void> _loadAutoScroll() async {
    final autoScroll = await _preferences.autoScroll.get();
    if (mounted) {
      setState(() {
        _isAutoScroll = autoScroll;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: const Icon(Icons.vertical_align_bottom_outlined),
      title: const Text('預設自動滾動'),
      subtitle: const Text('開啟日誌頁面時，是否預設啟用自動滾動到最底端。'),
      value: _isAutoScroll ?? true,
      onChanged: (value) async {
        await _preferences.autoScroll.set(value);
        setState(() {
          _isAutoScroll = value;
        });
      },
    );
  }
}
