import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acs_display/todos_overview/todos_overview.dart';

@visibleForTesting
enum TodosOverviewOption { toggleAll, clearCompleted }

class TodosOverviewOptionsButton extends StatelessWidget {
  const TodosOverviewOptionsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.select((TodosOverviewBloc bloc) => bloc.state.todos);
    final hasTodos = todos.isNotEmpty;
    final completedTodosAmount = todos.where((todo) => todo.isCompleted).length;

    return PopupMenuButton<TodosOverviewOption>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      tooltip: 'l10n.todosOverviewOptionsTooltip,',
      onSelected: (options) {
        switch (options) {
          case TodosOverviewOption.toggleAll:
            context
                .read<TodosOverviewBloc>()
                .add(const TodosOverviewToggleAllRequested());
            break;
          case TodosOverviewOption.clearCompleted:
            context
                .read<TodosOverviewBloc>()
                .add(const TodosOverviewClearCompletedRequested());
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: TodosOverviewOption.toggleAll,
            enabled: hasTodos,
            child: Text(
              completedTodosAmount == todos.length
                  ? 'l10n.todosOverviewOptionsMarkAllIncomplete'
                  : 'l10n.todosOverviewOptionsMarkAllComplete',
            ),
          ),
          PopupMenuItem(
            value: TodosOverviewOption.clearCompleted,
            enabled: hasTodos && completedTodosAmount > 0,
            child: Text('l10n.todosOverviewOptionsClearCompleted'),
          ),
        ];
      },
      icon: const Icon(Icons.more_vert_rounded),
    );
  }
}
