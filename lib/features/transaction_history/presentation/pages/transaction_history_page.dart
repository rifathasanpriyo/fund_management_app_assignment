import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../bloc/transaction_bloc.dart';
import '../../domain/entities/transaction_entity.dart';
import '../bloc/transaction_event.dart';
import '../bloc/transaction_state.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  final ScrollController _scrollController = ScrollController();
  String? typeFilter;

  @override
  void initState() {
    super.initState();
    context.read<TransactionBloc>().add(LoadTransactionsEvent(isRefresh: true));
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 150) {
      context.read<TransactionBloc>().add(
        LoadTransactionsEvent(typeFilter: typeFilter),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transaction History",
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: Column(
        children: [
          // _filterButtons(),
          Expanded(
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state is TransactionLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                if (state is TransactionLoaded) {
                  if (state.transactions.isEmpty) {
                    return const Center(child: Text("No transactions found"));
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        state.transactions.length + (state.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == state.transactions.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final tx = state.transactions[index];
                      return _transactionTile(tx);
                    },
                  );
                }

                if (state is TransactionError) {
                  return Center(child: Text(state.message));
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionTile(TransactionHistoryEntity tx) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.blue,
          child: Icon(Icons.monetization_on, color: Colors.white),
        ),
        title: Text(tx.title),
        subtitle: Text(tx.date),
        trailing: Text(
          tx.amount.toStringAsFixed(2),
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
