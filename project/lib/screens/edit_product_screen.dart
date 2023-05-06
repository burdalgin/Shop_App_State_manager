import 'package:flutter/material.dart';
import '../providers/product_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product-screen';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<
      FormState>(); //назначаем переменную Global Key для доступа к State формы, т.е. к значениям формы
  var _editedProduct =
      Product(id: null, title: '', description: '', price: 0, imageUrl: '');

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if (_imageUrlController.text.isEmpty ||
          (!_imageUrlController.text.startsWith('http') &&
                  !_imageUrlController.text.startsWith('https')) &&
              (!_imageUrlController.text.endsWith('.png') &&
                  !_imageUrlController.text.endsWith('.jpg') &&
                  !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
    }
    setState(() {});
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }

    _form.currentState.save(); //сохраняем данные черезе Global Key - FormState
  }

  @override
  void dispose() //стираем значение после выхода перед входом на страницу
  {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _descriptionNode.dispose();
    _priceFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _form, //назначаем Global Key для доступа к State формы
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Title',
                    errorStyle: TextStyle(color: Colors.red)),
                textInputAction: TextInputAction
                    .next, //кнопка перехоа на следующую строку на клавиатуре
                onFieldSubmitted: (_) =>
                    {FocusScope.of(context).requestFocus(_priceFocusNode)},
                onSaved: (newValue) {
                  _editedProduct = Product(
                      id: null,
                      title: newValue,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provider a value';
                  } else
                    return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction
                    .next, //кнопка перехоа на следующую строку на клавиатуре
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) =>
                    {FocusScope.of(context).requestFocus(_descriptionNode)},
                onSaved: (newValue) {
                  _editedProduct = Product(
                      id: null,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(newValue),
                      imageUrl: _editedProduct.imageUrl);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a Price';
                  }

                  if (double.parse(value) == null) {
                    return 'Please provide a valid number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than ZERO';
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction
                    .next, //кнопка перехоа на следующую строку на клавиатуре
                onFieldSubmitted: (_) =>
                    {FocusScope.of(context).requestFocus(_priceFocusNode)},
                focusNode: _descriptionNode,
                onSaved: (newValue) {
                  _editedProduct = Product(
                      id: null,
                      title: _editedProduct.title,
                      description: newValue,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description';
                  }
                  if (value.length < 10) {
                    return 'Should be atleast 10 characters';
                  }
                  return null; //означает что валидация пройдена
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      onFieldSubmitted:
                          (_) //используется (_) потому что onFieldSubmitted принимает String
                          {
                        _saveForm();
                      },
                      onSaved: (newValue) {
                        _editedProduct = Product(
                            id: null,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: newValue);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a URL';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a VALID URL';
                        }
                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'Please enter a valid IMAGE URL';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
