import 'dart:io';

void main(List<String> arguments) {
 if (arguments.isEmpty) {
 print('usage: dart totals.dart <inputFile.csv>');
 exit(1);
 }
 final inputfile = arguments.first;
 print(inputfile);

}