import 'package:flutter/material.dart';

class InputTheme{
  TextStyle _builtTestStyle(Color color, {double size = 16.0}) {
    return TextStyle(
      color: color,
      fontSize: size,
    );
  }

  OutlineInputBorder _buildBorder(Color color){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: color,
        width: 1.3,
      ),
    );
  }


  // BoxDecoration _buildBox(Color color){
  //   return BoxDecoration(
  //     color: Colors.grey[200],
  //     border: Border.all(color: Colors.white),
  //     borderRadius: BorderRadius.circular(12),
  //   );
  // }


  InputDecorationTheme theme() => InputDecorationTheme(
    contentPadding: EdgeInsets.all(20),
    //contentPadding: EdgeInsets.only(left: 20.0),
    //isDense seems to do nothing if you pass padding in
    isDense: true,
    //"always" put the label at the top
    floatingLabelBehavior: FloatingLabelBehavior.always,
    //Useful for putting Textfields in a row,
    //However, it might be more desirable to wrap with Flexible
    //to make them grow to the available width
    //constraints: BoxConstraints(maxWidth: 150),

    //Filling box
    filled: true,
    fillColor: Colors.white38,


    //Borders
    //Enabled and not showing error
    enabledBorder: _buildBorder(Colors.grey[600]!),
    //Has error but not focus
    errorBorder: _buildBorder(Colors.red),
    //Has error
    focusedErrorBorder: _buildBorder(Colors.red),
    //Default value if borders are null
    border: _buildBorder(Colors.yellow),
    //Enabled and focused
    focusedBorder: _buildBorder(Colors.green),
    //Disabled
    disabledBorder: _buildBorder(Colors.grey[400]!),

    //Text Styles
    suffixStyle: _builtTestStyle(Colors.black),
    counterStyle: _builtTestStyle(Colors.grey, size: 12.0),
    floatingLabelStyle: _builtTestStyle(Colors.black),
    //Make error and helper the same size, so that the field
    //does not grow in height when there is an error
    errorStyle: _builtTestStyle(Colors.red, size: 12.0),
    helperStyle: _builtTestStyle(Colors.black, size: 12.0),
    hintStyle: _builtTestStyle(Colors.grey),
    labelStyle: _builtTestStyle(Colors.black),
    prefixStyle: _builtTestStyle(Colors.black),

  );
}

