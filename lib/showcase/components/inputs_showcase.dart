import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class InputsShowcase extends StatefulWidget {
  const InputsShowcase({super.key});

  @override
  State<InputsShowcase> createState() => _InputsShowcaseState();
}

class _InputsShowcaseState extends State<InputsShowcase> {
  String? _selectedFruit;
  String? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Inputs',
      children: [
        const ComponentPreview(
          title: 'Standard Input',
          description: 'Common text field with label and placeholder.',
          content: FoundryInput(label: 'Email', placeholder: 'Enter your email'),
        ),
        const FoundryGap.xl(),
        const ComponentPreview(
          title: 'Password Input',
          description: 'Obscured text field for sensitive data.',
          content: FoundryInput(label: 'Password', placeholder: 'Enter your password', obscureText: true),
        ),
        const FoundryGap.xl(),
        const ComponentPreview(
          title: 'Error State',
          description: 'Input displaying an error message validation.',
          content: FoundryInput(
            label: 'Username',
            placeholder: 'Enter username',
            errorText: 'This username is already taken',
            controller: null,
          ),
        ),
        const FoundryGap.xl(),
        const ComponentPreview(
          title: 'No Label',
          description: 'Simple input without a label, good for search bars.',
          content: FoundryInput(placeholder: 'Search...'),
        ),
        const FoundryGap.xxl(),
        FoundryText.headingSmall('Select'),
        const FoundryGap.md(),
        ComponentPreview(
          title: 'Basic Select',
          description: 'Dropdown menu for selecting from a list of options.',
          content: FoundrySelect<String>(
            label: 'Favorite Fruit',
            placeholder: 'Select a fruit',
            value: _selectedFruit,
            onChanged: (value) => setState(() => _selectedFruit = value),
            options: const [
              FoundrySelectOption(value: 'apple', label: 'Apple'),
              FoundrySelectOption(value: 'banana', label: 'Banana'),
              FoundrySelectOption(value: 'cherry', label: 'Cherry'),
              FoundrySelectOption(value: 'mango', label: 'Mango'),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Select with Error',
          description: 'Select field displaying validation error.',
          content: FoundrySelect<String>(
            label: 'Country',
            placeholder: 'Select a country',
            value: _selectedCountry,
            onChanged: (value) => setState(() => _selectedCountry = value),
            errorText: 'Please select a country',
            options: const [
              FoundrySelectOption(value: 'us', label: 'United States'),
              FoundrySelectOption(value: 'uk', label: 'United Kingdom'),
              FoundrySelectOption(value: 'br', label: 'Brazil'),
            ],
          ),
        ),
        const FoundryGap.xl(),
        ComponentPreview(
          title: 'Disabled Select',
          description: 'Select field that is not interactive.',
          content: FoundrySelect<String>(
            label: 'Region',
            value: 'north',
            onChanged: null,
            isDisabled: true,
            options: const [
              FoundrySelectOption(value: 'north', label: 'North'),
              FoundrySelectOption(value: 'south', label: 'South'),
            ],
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }
}
