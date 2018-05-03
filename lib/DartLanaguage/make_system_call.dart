main() {
  var visa_in_text = new RegExp(r"\b4[0-9]{12}(?:[0-9]{3})?\b");
  var text = "Does this text mention a VISA 4457418557635128 number?";
  var matches = visa_in_text.allMatches(text);
  for (var m in matches) {
    print(m.group(0));
  }
}