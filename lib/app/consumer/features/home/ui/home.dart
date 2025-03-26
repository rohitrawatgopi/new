import 'package:know_go/imports/app_imports.dart';

class LocalHome extends StatelessWidget {
  const LocalHome({super.key});

  @override
  Widget build(BuildContext context) {
    final hg = MediaQuery.of(context).size.height;
    final mapController = MapController();

    return BlocProvider(
      create: (context) => HomeBloc()..add(FetchCurrentLocationEvent()),
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<HomeBloc, HomeState>(
            listenWhen: (previous, current) => current is HomeActionState,
            buildWhen: (previous, current) => current is! HomeActionState,
            listener: (context, state) {
              if (state is HomeShowErrorActionState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              } else if (state is HomeNavigateToCategoryActionState) {
                Navigator.pushNamed(
                  context,
                  '/category',
                  arguments: {
                    'currentLocation': state.currentLocation,
                    'interestedLocation': state.interestedLocation,
                  },
                );
              }
            },
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: hg,
                    width: double.infinity,
                    child: FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                        initialCenter: state.currentLocationLat,
                        initialZoom: 16.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: state.currentLocationLat,
                              width: 40,
                              height: 40,
                              child: const Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  style: ButtonStyle(
                                    iconSize: WidgetStateProperty.all(24),
                                    backgroundColor: WidgetStateProperty.all(
                                      AppColors.appColor,
                                    ),
                                    minimumSize: WidgetStateProperty.all(
                                      Size(48, 48),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/images/menu.svg',
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [const FolderButton()],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                AppText(
                                  title: 'Welcome Back, User',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appWhite,
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: CallList.new,
                                  child: const CartDropdown(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            AppText(
                              title: 'Let\'s Get Started',
                              color: AppColors.appWhite,
                              fontSize: 12,
                            ),
                            const SizedBox(height: 30),
                            LocationFields(state: state),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(bottom: 140, child: NextButton(state: state)),
                  LocalMatePrompt(hg: hg),
                  if (state.isSidebarOpen)
                    Sidebar(
                      onClose:
                          () => context.read<HomeBloc>().add(
                            ToggleSidebarEvent(),
                          ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
