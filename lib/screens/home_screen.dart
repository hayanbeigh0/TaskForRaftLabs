import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/api_data_entries.dart';

import '../logic/blocs/public_api/public_api_bloc.dart';
import '../widgets/vertical_card_spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<PublicApiBloc, PublicApiState>(
        builder: (context, state) {
          if (state is PublicApiInitial) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<PublicApiBloc>(context)
                      .add(PublicApiLoading());
                },
                child: const Text('Fetch Data'),
              ),
            );
          }
          if (state is PublicApiLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PublicApiLoadingErrorState) {
            return Center(
              child: Text(state.msg),
            );
          }
          if (state is PublicApiLoadedState) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const VerticalCardSpacing(),
                        ApiDataEntriesWidget(
                          title: 'API:',
                          info: state.data.entries[index].api,
                        ),
                        const VerticalCardSpacing(),
                        ApiDataEntriesWidget(
                          title: 'Description:',
                          info: state.data.entries[index].description,
                        ),
                        const VerticalCardSpacing(),
                        ApiDataEntriesWidget(
                          title: 'Auth:',
                          info: state.data.entries[index].auth,
                        ),
                        const VerticalCardSpacing(),
                        ApiDataEntriesWidget(
                          title: 'HTTPS:',
                          info: state.data.entries[index].https.toString(),
                        ),
                        const VerticalCardSpacing(),
                        ApiDataEntriesWidget(
                          title: 'Cors:',
                          info: state.data.entries[index].cors,
                        ),
                        const VerticalCardSpacing(),
                        ApiDataEntriesWidget(
                          title: 'Link:',
                          info: state.data.entries[index].link,
                        ),
                        const VerticalCardSpacing(),
                        ApiDataEntriesWidget(
                          title: 'Category:',
                          info: state.data.entries[index].category,
                        ),
                        const VerticalCardSpacing(),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
