
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:bmi/provider/calculator_brain.dart';


List<SingleChildWidget> providers = [...providersList];

//independent providers
List<SingleChildWidget> providersList = [

  ChangeNotifierProvider(create: (_) => CalculatorNotifier()),
];