import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';


// typedef DiscountCallback  = void Function(String discount, String dataFrom, String dataTo);


class BottomSheetUtils {


  static showAgreementBottomSheet(context, Function add) {

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        // enableDrag: true,
        // isScrollControlled: true,
        context: context,
        builder: (builder) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AddUrl(add: (tags)=> add(tags),);
            }
          );
        });
  }


}


class AddUrl extends StatefulWidget {
  final Function add;
  const AddUrl({Key? key, required this.add}) : super(key: key);

  @override
  State<AddUrl> createState() => _AddUrlState();
}

class _AddUrlState extends State<AddUrl> {

  late double _distanceToField;
  late TextfieldTagsController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 55,
              height: 8,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: TextFieldTags(
              textfieldTagsController: _controller,
              initialTags: const [],
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              validator: (String tag) {
                // if (tag == 'php') {
                //   return 'No, please just no';
                // } else
                if (_controller.getTags!.contains(tag)) {
                  return 'you already entered that';
                }
                return null;
              },
              inputfieldBuilder:
                  (context, tec, fn, error, onChanged, onSubmitted) {
                return ((context, sc, tags, onTagDelete) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: tec,
                          focusNode: fn,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            isDense: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 74, 137, 92),
                                width: 3.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 74, 137, 92),
                                width: 3.0,
                              ),
                            ),
                            helperText: 'Enter url text...',
                            helperStyle: const TextStyle(
                              color: Color.fromARGB(255, 74, 137, 92),
                            ),
                            hintText: _controller.hasTags ? '' : "Enter url...",
                            errorText: error,
                            prefixIconConstraints:
                            BoxConstraints(maxWidth: _distanceToField * 0.74),
                          ),
                          onChanged: onChanged,
                          onSubmitted: onSubmitted,
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: sc,
                            // scrollDirection: Axis.horizontal,
                            child: Wrap(
                                runSpacing: 5.0,
                                spacing: 5.0,
                                children: tags.map((String tag) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: Color.fromARGB(255, 74, 137, 92),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            '$tag',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          onTap: () {
                                            print("$tag selected");
                                          },
                                        ),
                                        const SizedBox(width: 4.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 22.0,
                                            color: Color.fromARGB(
                                                255, 233, 233, 233),
                                          ),
                                          onTap: () {
                                            onTagDelete(tag);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }).toList()),
                          ),
                        ),

                      ],
                    ),
                  );
                });
              },
            ),
          ),
          TextButton(onPressed: ()=> _controller.getTags!.isNotEmpty ? widget.add(_controller.getTags) : (){}, child: Text("Add"))
        ],
      ),
    );
  }
}
