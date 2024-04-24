import 'dart:io';

void main(List<String> arguments) {
 if (arguments.isEmpty) {
 print('usage: dart totals.dart <inputFile.csv>');
 exit(1);
 }
 final inputFile = arguments.first;
 final lines = File(inputFile).readAsLinesSync(); 
 final totalDurationByTag = <String, double>{};
 lines.removeAt(0);
 var totalDuration = 0.0;
 for (var line in lines) {
  final values = line.split(',');
  final durationStr = values[3].replaceAll('"', ''); 
  final duration = double.parse(durationStr);
  final tag = values[5].replaceAll('"', '');
  final previousTotal = totalDurationByTag[tag];
  if (previousTotal == null){
    totalDurationByTag[tag] = duration;
  } else {
    totalDurationByTag[tag] = previousTotal + duration;
  }
  totalDuration += duration;
 }

 for (var entry in totalDurationByTag.entries){
  final durtationFormatted = entry.value.toStringAsFixed(1);
  final tag = entry.key == '' ? 'unallocated' : entry.key;
  print('$tag: ${durtationFormatted}h');
 }
 print('total for all tags: ${totalDuration.toStringAsFixed(1)}');
}
// lines = readFile(inputFile)
// durationByTag = empty map
// lines.removeFirst()
// for (line in lines)
//   values = line.split(',')
//   duration = values[3]
//   tag = values[5]
//   update(durationByTag[tag], duration)
// end
// printAll(durationByTag)