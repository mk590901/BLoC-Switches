// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:button_k_states/events/switch_events.dart';
import 'package:button_k_states/flow_counter.dart';
import 'package:button_k_states/state_machines/basic_state_machine.dart';
import 'package:button_k_states/state_machines/button_state_machine.dart';
import 'package:button_k_states/state_machines/switch_advanced_state_machine.dart';
import 'package:button_k_states/states/switch_advanced_state.dart';
import 'package:button_k_states/states/button_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SwitchAdvancedStateMachine', () {
    BasicStateMachine?
      stateMachine = SwitchAdvancedStateMachine(SwitchAdvancedState.state_(SwitchAdvancedStates.off));
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.off));
    stateMachine.dispatch(Reset());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.off));
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.off2on));
    stateMachine.dispatch(Reset());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.off));
//  off->on via off2on
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.off2on));
    stateMachine.dispatch(Up());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.on));
//  on->off with reset
    stateMachine.dispatch(Reset());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.off));
//  off->on via off2on
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.off2on));
    stateMachine.dispatch(Up());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.on));
//  on->on2off with down
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.on2off));
//  on2off->off with reset
    stateMachine.dispatch(Reset());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.on));
//  off->on via off2on
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.on2off));
    stateMachine.dispatch(Up());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.off));
//  on->on2off with down
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.off2on));
//  on2off->off with reset
    stateMachine.dispatch(Up());
    expect(stateMachine.state(),SwitchAdvancedState.state_(SwitchAdvancedStates.on));
  });

  test('ButtonStateMachine', () {
    BasicStateMachine?
      stateMachine = ButtonStateMachine(ButtonState.state_(ButtonStates.ready));
    expect(stateMachine.state(),  ButtonState.state_(ButtonStates.ready));
    stateMachine.dispatch(Disable());
    expect(stateMachine.state(),  ButtonState.state_(ButtonStates.disabled));
    stateMachine.dispatch(Enable());
    expect(stateMachine.state(),  ButtonState.state_(ButtonStates.ready));
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),  ButtonState.state_(ButtonStates.pressed));
    stateMachine.dispatch(Reset());
    expect(stateMachine.state(),  ButtonState.state_(ButtonStates.ready));
    stateMachine.dispatch(Down());
    expect(stateMachine.state(),  ButtonState.state_(ButtonStates.pressed));
    stateMachine.dispatch(Up());
    expect(stateMachine.state(),  ButtonState.state_(ButtonStates.ready));

  });

  test('FlowCounter', () {
    final FlowCounter flowCounter = FlowCounter(25, 250, 25, 100);
    expect(flowCounter.value(),100);
    expect(flowCounter.dec(), 75);
    expect(flowCounter.dec(), 50);
    expect(flowCounter.dec(), 25);
    expect(flowCounter.dec(), 25);
    expect(flowCounter.inc(), 50);
    expect(flowCounter.inc(), 75);
    expect(flowCounter.inc(),100);
    expect(flowCounter.inc(),125);
    expect(flowCounter.inc(),150);
    expect(flowCounter.inc(),175);
    expect(flowCounter.inc(),200);
    expect(flowCounter.inc(),225);
    expect(flowCounter.inc(),250);
    expect(flowCounter.inc(),250);

  });

}
