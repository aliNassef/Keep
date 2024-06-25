import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared/widgets/custom_icon.dart';
import '../../../../../core/shared/widgets/custom_sized_box.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../home/data/model/note_model.dart';
import '../../../../home/presentation/views/widgets/note_item.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _controller = TextEditingController();

  List<NoteModel> filteredItems = [];
  @override
  void initState() {
    super.initState();
    filteredItems = AppConstants.notes;
    _controller.addListener(_search);
  }

  void _search() {
    final query = _controller.text.toLowerCase();
    setState(() {
      filteredItems = AppConstants.notes.where((item) {
        return item.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  context.go(AppRouter.homeView);
                },
                child: const CustomIcon(
                  icon: Icons.arrow_back_ios_new_rounded,
                ),
              ),
              const VerticalSpace(30),
              TextField(
                style: AppStyles.textStyle20L,
                controller: _controller,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Search by the keyword...',
                  hintStyle: AppStyles.textStyle20L,
                  fillColor: const Color(0xff3B3B3B),
                  filled: true,
                  border: buildBorderSearchBar(),
                  enabledBorder: buildBorderSearchBar(),
                  focusedBorder: buildBorderSearchBar(),
                ),
              ),
              const VerticalSpace(40),
              filteredItems.isEmpty
                  ? Column(
                      children: [
                        VerticalSpace(MediaQuery.sizeOf(context).height * .15),
                        Center(
                          child: Image.asset(
                            AppImages.search,
                            height: MediaQuery.sizeOf(context).height * .25,
                            width: MediaQuery.sizeOf(context).width,
                          ),
                        ),
                      ],
                    )
                  : MasonryGridView.builder(
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 15.h,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        return NoteItem(
                          index: index,
                          note: filteredItems[index],
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorderSearchBar() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}
/*
MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 15.h,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return NoteItem(
                        index: index,
                        note:filteredItems[index],
                      );
                    },
                  )



 */