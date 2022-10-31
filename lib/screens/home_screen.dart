import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Press the button below to load the data from an API',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                            Theme.of(context).buttonTheme.colorScheme!.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<PublicApiBloc>(context)
                            .add(PublicApiLoading());
                      },
                      child: const Text(
                        'Fetch Data',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
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
              child: Text(
                state.msg,
                style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
          if (state is PublicApiLoadedState) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Card(
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
