import 'package:flutter/material.dart';
import 'package:foundry_ds/foundry_ds.dart';
import '../shared/shared.dart';

class SelectionControlsShowcase extends StatefulWidget {
  const SelectionControlsShowcase({super.key});

  @override
  State<SelectionControlsShowcase> createState() => _SelectionControlsShowcaseState();
}

class _SelectionControlsShowcaseState extends State<SelectionControlsShowcase> {
  bool _switchVal = false;
  bool? _checkVal = false;
  bool? _tristateVal; // null is indeterminate
  String _radioVal = 'option1';
  double _sliderVal = 0.5;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Selection Controls',
      children: [
        ComponentPreview(
          title: 'Switch',
          description: 'Toggles between two states.',
          content: FoundryVStack.md(
            children: [
              FoundryHStack.lg(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FoundrySwitch(value: _switchVal, onChanged: (v) => setState(() => _switchVal = v)),
                  FoundrySwitch(value: true, onChanged: (v) {}, isDisabled: true),
                  FoundrySwitch(value: false, onChanged: (v) {}, isDisabled: true),
                ],
              ),
              FoundrySwitchTile(
                value: _switchVal,
                onChanged: (v) => setState(() => _switchVal = v),
                label: 'Notifications',
                description: 'Receive push notifications',
              ),
            ],
          ),
        ),

        const FoundryGap.xl(),

        ComponentPreview(
          title: 'Checkbox',
          description: 'Selects one or multiple items.',
          content: FoundryVStack.md(
            children: [
              FoundryHStack.lg(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FoundryCheckbox(value: _checkVal, onChanged: (v) => setState(() => _checkVal = v)),
                  FoundryCheckbox(
                    value: _tristateVal,
                    onChanged: (v) => setState(() => _tristateVal = v),
                    tristate: true,
                  ),
                  const FoundryCheckbox(value: true, onChanged: null, isDisabled: true),
                ],
              ),
              FoundryCheckboxTile(
                value: _checkVal,
                onChanged: (v) => setState(() => _checkVal = v),
                label: 'Subscribe to newsletter',
              ),
            ],
          ),
        ),

        const FoundryGap.xl(),

        ComponentPreview(
          title: 'Radio',
          description: 'Selects a single option from a list.',
          content: FoundryVStack.xs(
            children: [
              FoundryRadioTile<String>(
                value: 'option1',
                groupValue: _radioVal,
                onChanged: (v) => setState(() => _radioVal = v!),
                label: 'Option 1',
              ),
              FoundryRadioTile<String>(
                value: 'option2',
                groupValue: _radioVal,
                onChanged: (v) => setState(() => _radioVal = v!),
                label: 'Option 2',
              ),
              FoundryRadioTile<String>(
                value: 'option3',
                groupValue: _radioVal,
                onChanged: null,
                isDisabled: true,
                label: 'Option 3 (Disabled)',
              ),
            ],
          ),
        ),

        const FoundryGap.xl(),

        ComponentPreview(
          title: 'Slider',
          description: 'Selects a value from a range.',
          content: FoundryVStack.md(
            children: [
              FoundrySlider(value: _sliderVal, onChanged: (v) => setState(() => _sliderVal = v)),
              FoundrySlider(
                value: _sliderVal,
                onChanged: (v) => setState(() => _sliderVal = v),
                divisions: 10,
                showLabel: true,
              ),
              const FoundrySlider(value: 0.3, onChanged: null, isDisabled: true),
            ],
          ),
        ),
        const FoundryGap.xxl(),
      ],
    );
  }
}
