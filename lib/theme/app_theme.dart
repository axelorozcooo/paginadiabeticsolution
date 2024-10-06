
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


const Color azulkens = Color(0xFFBDF0F0);
const Color azul = Color(0xFF1C70FF);
const Color verdeAwa = Color(0xFF00BFBF);
const Color verdeAwa2 = Color(0xFF00ACAC);
const Color verde = Color(0xFF0BD485);

// Gradiente de fondo
const BoxDecoration fondoGradiente = BoxDecoration(
  gradient: LinearGradient(
    colors: [azul, verdeAwa, verde, verdeAwa, azul],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String labelText;
  final bool isDateOfBirth;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.labelText,
    this.isDateOfBirth = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1926),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        widget.controller.text = DateFormat('yyyy-MM-dd').format(picked);
        _errorMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDecimal = widget.keyboardType ==
        const TextInputType.numberWithOptions(signed: false, decimal: true);
    bool isInteger = widget.keyboardType ==
        const TextInputType.numberWithOptions(signed: false, decimal: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          style: const TextStyle(color: Colors.black, fontFamily: 'lspartanr'),
          inputFormatters: isDecimal
              ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))]
              : isInteger
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : [],
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(
                color: Color.fromARGB(255, 87, 87, 87),
                fontFamily: 'lspartanb'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: verdeAwa),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: verdeAwa, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: verdeAwa),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
            suffixIcon: widget.isDateOfBirth
                ? IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.black),
                    onPressed: () => _selectDate(context),
                  )
                : widget.obscureText
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: _toggleObscureText,
                      )
                    : null,
            errorText: _errorMessage,
          ),
          onChanged: (value) {
            setState(() {
              if (isInteger) {
                _errorMessage = int.tryParse(value) == null
                    ? 'Ingresa un número entero válido'
                    : null;
              } else if (isDecimal) {
                if (value.isEmpty) {
                  _errorMessage = null;
                } else if (double.tryParse(value) == null) {
                  _errorMessage = 'Ingresa un número decimal válido';
                } else if (!value.contains('.')) {
                  _errorMessage = 'Debe contener un punto decimal';
                } else {
                  _errorMessage = null;
                }
              }
            });
          },
        ),
      ],
    );
  }
}

// Widget personalizado para botones
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: verdeAwa2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontSize: 20.5, fontFamily: 'lspartansb')),
    );
  }
}

// Widget personalizado para botones con imagen
class CustomButtonImage extends StatefulWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  const CustomButtonImage({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
    required this.padding,
  }) : super(key: key);

  @override
  _CustomButtonImageState createState() => _CustomButtonImageState();
}

class _CustomButtonImageState extends State<CustomButtonImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
        widget.onPressed();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          padding: widget.padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(widget.imagePath, height: 140.0),
              const SizedBox(height: 1.0),
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'lspartanr',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget personalizado para listas desplegables
class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String labelText;

  const CustomDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: verdeAwa),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: verdeAwa),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: verdeAwa),
        ),
      ),
      value: value,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// Widget personalizado para CheckBox
class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String title;
  final String imagePath;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      title: Row(
        children: [
          Image.asset(
            imagePath,
            width: 55,
            height: 55,
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(title)),
        ],
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: verdeAwa,
    );
  }
}

//Widget personalizado para cajas de texto simple
class SimpleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool readOnly;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;

  const SimpleTextField({
    Key? key,
    required this.controller,
    this.hintText = "",
    this.readOnly = false,
    this.textStyle,
    this.hintStyle,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      style: textStyle,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ??
            const TextStyle(color: Color.fromARGB(255, 134, 134, 134)),
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: verdeAwa),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: verdeAwa),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: verdeAwa),
        ),
      ),
    );
  }
}

// Widget personalizado para TabBar
class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomTabBar({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabWidth = screenWidth / tabs.length;

    return Container(
      color: Colors.white,
      child: SizedBox(
        height: 200.0,
        child: TabBar(
          indicator: const BoxDecoration(
            color: azulkens,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          labelColor: azulkens,
          unselectedLabelColor: Colors.grey,
          tabs: List.generate(tabs.length, (index) {
            bool isSelected = index == selectedIndex;
            return Tab(
              child: Container(
                width: tabWidth,
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isSelected)
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/${tabs[index]}.png'),
                            fit: BoxFit.contain,
                            colorFilter: const ColorFilter.mode(
                              verdeAwa,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    if (isSelected) ...[
                      const SizedBox(height: 3.0),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          tabs[index],
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: verdeAwa2,
                            fontFamily: 'lspartansb',
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
          onTap: onTap,
        ),
      ),
    );
  }
}
