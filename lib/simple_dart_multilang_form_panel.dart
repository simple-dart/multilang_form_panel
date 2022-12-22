import 'package:simple_dart_multilang_label/simple_dart_multilang_label.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class MultilangFormPanel extends PanelComponent {
  List<Panel> rows = <Panel>[];
  List<MultilangLabel> labels = <MultilangLabel>[];
  String _formSpacing = '';
  String _labelsWidth = '';

  MultilangFormPanel() : super('FormPanel') {
    vertical = true;
  }

  void addComponent(String langKey, Component component) {
    final multiLangLabel = MultilangLabel()
      ..langKey = langKey
      ..width = _labelsWidth;
    final row = Panel()
      ..spacing = _formSpacing
      ..add(multiLangLabel)
      ..add(component);
    labels.add(multiLangLabel);
    rows.add(row);
    add(row);
  }

  void addLabel(String langKey, String labelLangKey) {
    final multiLangLabel = MultilangLabel()..langKey = labelLangKey;
    addComponent(langKey, multiLangLabel);
  }

  set formSpacing(String value) {
    _formSpacing = value;
    for (final row in rows) {
      row.spacing = _formSpacing;
    }
  }

  String get formSpacing => _formSpacing;

  set labelsWidth(String value) {
    _labelsWidth = value;
    for (final row in rows) {
      row.children.first.width = _labelsWidth;
    }
  }

  @override
  void clear() {
    rows.clear();
    super.clear();
  }

  String get labelsWidth => _labelsWidth;
}
