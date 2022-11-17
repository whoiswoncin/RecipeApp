import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetails({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.recipe.label),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          SizedBox(
              height: 350,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.recipe.label,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          //Add Expanded
          Expanded(
            child: ListView.builder(
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final ingredient = widget.recipe.ingredients[index];
                return Text(
                    '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}');
              },
            ),
          ),
          Slider(
            min: 1,
            max: 10,
            divisions: 10,                       
            label: '${_sliderVal * widget.recipe.servings} servings',
            value: _sliderVal.toDouble(),
            onChanged: (newValue) {
              setState(() {
                _sliderVal = newValue.round();
              });
            },
            // 14
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ),
        ]),
      ),
    );
  }
}
