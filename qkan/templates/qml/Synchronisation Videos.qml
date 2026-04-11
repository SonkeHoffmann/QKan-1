<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis readOnly="0" version="3.40.14-Bratislava" styleCategories="LayerConfiguration|Symbology|Forms|AttributeTable|Notes">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <fieldConfiguration>
    <field name="pk">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="pk_best">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="pk_ext">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="aktion">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="status">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="untersuchtag">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="untersuchrichtung">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="objekt">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="datei">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column type="field" width="-1" hidden="0" name="pk"/>
      <column type="field" width="-1" hidden="0" name="pk_best"/>
      <column type="field" width="-1" hidden="0" name="pk_ext"/>
      <column type="field" width="-1" hidden="0" name="aktion"/>
      <column type="field" width="-1" hidden="0" name="status"/>
      <column type="field" width="-1" hidden="0" name="name"/>
      <column type="field" width="-1" hidden="0" name="untersuchtag"/>
      <column type="field" width="-1" hidden="0" name="untersuchrichtung"/>
      <column type="field" width="-1" hidden="0" name="objekt"/>
      <column type="field" width="-1" hidden="0" name="datei"/>
      <column type="actions" width="-1" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles>
      <style name="hinzufügen" background_color_alpha="255" rule="status and aktion = 'hinzufügen'" background_color="#9ad871">
        <font italic="0" underline="0" style="" bold="0" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" strikethrough="0"/>
      </style>
      <style name="nicht ausführen" text_color="#ff0000" rule="not status" text_color_alpha="255">
        <font italic="1" underline="0" style="" bold="0" description="MS Shell Dlg 2,8.25,-1,5,50,1,0,1,0,0" strikethrough="1"/>
      </style>
      <style name="ändern" background_color_alpha="255" rule="status and aktion = 'ändern'" background_color="#ff7f00">
        <font italic="0" underline="0" style="" bold="0" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" strikethrough="0"/>
      </style>
      <style name="löschen" background_color_alpha="255" rule="status and aktion = 'löschen'" background_color="#ff0000">
        <font italic="0" underline="0" style="" bold="0" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" strikethrough="0"/>
      </style>
    </rowstyles>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\sync_videos.ui</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS-Formulare können eine Python-Funktion haben,, die aufgerufen wird, wenn sich das Formular öffnet

Diese Funktion kann verwendet werden um dem Formular Extralogik hinzuzufügen.

Der Name der Funktion wird im Feld "Python Init-Function" angegeben
Ein Beispiel folgt:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <editable>
    <field name="aktion" editable="1"/>
    <field name="datei" editable="1"/>
    <field name="name" editable="1"/>
    <field name="objekt" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="pk_best" editable="1"/>
    <field name="pk_ext" editable="1"/>
    <field name="status" editable="1"/>
    <field name="untersuchrichtung" editable="1"/>
    <field name="untersuchtag" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="aktion" labelOnTop="0"/>
    <field name="datei" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="objekt" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="pk_best" labelOnTop="0"/>
    <field name="pk_ext" labelOnTop="0"/>
    <field name="status" labelOnTop="0"/>
    <field name="untersuchrichtung" labelOnTop="0"/>
    <field name="untersuchtag" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="aktion"/>
    <field reuseLastValue="0" name="datei"/>
    <field reuseLastValue="0" name="name"/>
    <field reuseLastValue="0" name="objekt"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="pk_best"/>
    <field reuseLastValue="0" name="pk_ext"/>
    <field reuseLastValue="0" name="status"/>
    <field reuseLastValue="0" name="untersuchrichtung"/>
    <field reuseLastValue="0" name="untersuchtag"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"name"</previewExpression>
  <layerGeometryType>4</layerGeometryType>
</qgis>
