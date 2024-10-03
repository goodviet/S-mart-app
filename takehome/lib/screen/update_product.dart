import 'package:flutter/material.dart';
import 'package:takehome/service/service.app.dart';
import 'package:takehome/widget/button_widget.dart';
import 'package:takehome/widget/textfield_update_widget.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({Key? key, required this.listProduct})
      : super(key: key);
  static const String routeName = '/update_product';

  final Map<String, dynamic> listProduct;

  @override
  _UpdateProductScreenState createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  AppService appService = AppService();

  final _textControllerTitle = TextEditingController();
  final _textControllerPriceOriginal = TextEditingController();
  final _textControllerDescription = TextEditingController();
  final _textControllerPriceDiscounted = TextEditingController();
  final _textControllerDCPercent = TextEditingController();
  final _textControllerImageURL = TextEditingController();

  late List<Map<String, dynamic>> _textFieldData;

  @override
  void initState() {
    super.initState();
    _loadProductDetails();
    _textFieldData = [
      {'label': 'Title', 'controller': _textControllerTitle},
      {'label': 'Price Original', 'controller': _textControllerPriceOriginal},
      {
        'label': 'Description',
        'controller': _textControllerDescription,
        'maxLine': 4
      },
      {'label': 'Discount Percentage', 'controller': _textControllerDCPercent},
      {'label': 'Discount Price', 'controller': _textControllerPriceDiscounted},
    ];
  }

  void _loadProductDetails() {
    _textControllerTitle.text = widget.listProduct['title'];
    _textControllerPriceOriginal.text =
        widget.listProduct['priceOriginal'].toString();
    _textControllerDescription.text = widget.listProduct['description'];
    _textControllerPriceDiscounted.text =
        widget.listProduct['priceDiscounted'].toString();
    _textControllerDCPercent.text =
        widget.listProduct['discountPercentage'].toString();
    _textControllerImageURL.text = widget.listProduct['imgProduct'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Update Product',
          style: TextStyle(
              color: Color(0xffAB3130),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            '${widget.listProduct['imgProduct']}')),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey)),
                child: Stack(children: [
                  Positioned(
                      child: Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(78, 217, 217, 217)),
                      child: Icon(Icons.add),
                    ),
                  ))
                ]),
              ),
              TextFieldUpdate(
                  labelText: 'Title', textController: _textControllerTitle),
              TextFieldUpdate(
                  labelText: 'Price Original',
                  textController: _textControllerPriceOriginal),
              TextFieldUpdate(
                  labelText: 'Description',
                  maxLine: 4,
                  textController: _textControllerDescription),
              TextFieldUpdate(
                  labelText: 'Discounted Percentage',
                  textController: _textControllerDCPercent),
              TextFieldUpdate(
                  labelText: 'Discount Perice',
                  textController: _textControllerPriceDiscounted),
              ButtonWidget(
                height: 2,
                title: 'Update',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
