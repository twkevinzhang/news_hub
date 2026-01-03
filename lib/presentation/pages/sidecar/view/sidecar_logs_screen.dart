import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/sidecar/bloc/sidecar_cubit.dart';

@RoutePage()
class SidecarLogsScreen extends StatefulWidget {
  const SidecarLogsScreen({super.key});

  @override
  State<SidecarLogsScreen> createState() => _SidecarLogsScreenState();
}

class _SidecarLogsScreenState extends State<SidecarLogsScreen> {
  final ScrollController _scrollController = ScrollController();
  late final SidecarCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = sl<SidecarCubit>();
    _cubit.startLogsWatch(minLevel: LogLevel.info);
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

  String _getLevelName(LogLevel level) {
    return level.name;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<SidecarCubit, SidecarState>(
        listener: (context, state) {
          // Auto-scroll when new logs arrive
          if (state.autoScroll && _scrollController.hasClients && state.logs.isNotEmpty) {
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
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Sidecar Logs'),
              actions: [
                IconButton(
                  icon: Icon(state.autoScroll ? Icons.pause : Icons.play_arrow),
                  onPressed: () => _cubit.toggleAutoScroll(),
                  tooltip: state.autoScroll ? 'Pause auto-scroll' : 'Resume auto-scroll',
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _cubit.clearLogs(),
                  tooltip: 'Clear logs',
                ),
              ],
            ),
            body: state.logs.isEmpty
                ? const Center(child: Text('No logs yet...'))
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: state.logs.length,
                    itemBuilder: (context, index) {
                      final log = state.logs[index];
                      final time = log.timestamp;

                      return ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.circle,
                          size: 8,
                          color: _getLevelColor(log.level),
                        ),
                        title: Text(
                          log.message,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: _getLevelColor(log.level),
                          ),
                        ),
                        subtitle: Text(
                          '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')} [${_getLevelName(log.level)}] ${log.loggerName}',
                          style: const TextStyle(fontSize: 10),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
