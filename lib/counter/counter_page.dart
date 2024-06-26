import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weartest/cubit/counter_cubit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Contador',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 1),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().increment(),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green, // Color del icono y el texto
              ),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 1),
            const CounterText(),
            const SizedBox(height: 1),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().decrement(),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red, // Color del icono y el texto
              ),
              child: const Icon(Icons.remove),
            ),
            const SizedBox(height: 1),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().reset(),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue, // Color del texto
              ),
              child: const Text('Resetear'),
            ),
            const SizedBox(height: 1),
            const LimitReachedText(),
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayMedium);
  }
}

class LimitReachedText extends StatelessWidget {
  const LimitReachedText({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select((CounterCubit cubit) => cubit.state);
    if (count >= 10 || count <= -10) {
      // Mostrar toast
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Fluttertoast.showToast(
          msg: "Límite alcanzado",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
    }
    return const SizedBox.shrink();
  }
}
