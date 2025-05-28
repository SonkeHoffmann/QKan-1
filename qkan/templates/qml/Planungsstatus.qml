<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes" hasScaleBasedVisibilityFlag="0" minScale="0" version="3.28.15-Firenze" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endField="" accumulate="0" startField="" endExpression="" fixedDuration="0" mode="0" limitMode="0" durationField="pk" enabled="0" durationUnit="min" startExpression="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option value="copy" type="QString" name="QFieldSync/action"/>
      <Option value="{}" type="QString" name="QFieldSync/attachment_naming"/>
      <Option value="offline" type="QString" name="QFieldSync/cloud_action"/>
      <Option value="" type="QString" name="QFieldSync/geometry_locked_expression"/>
      <Option value="{}" type="QString" name="QFieldSync/photo_naming"/>
      <Option value="{}" type="QString" name="QFieldSync/relationship_maximum_visible"/>
      <Option value="30" type="int" name="QFieldSync/tracking_distance_requirement_minimum_meters"/>
      <Option value="1" type="int" name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters"/>
      <Option value="0" type="int" name="QFieldSync/tracking_measurement_type"/>
      <Option value="30" type="int" name="QFieldSync/tracking_time_requirement_interval_seconds"/>
      <Option value="0" type="int" name="QFieldSync/value_map_button_interface_threshold"/>
      <Option type="List" name="dualview/previewExpressions">
        <Option value="&quot;bezeichnung&quot;" type="QString"/>
      </Option>
      <Option value="0" type="int" name="embeddedWidgets/count"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <legend type="default-vector" showLabelLegend="0"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="pk">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bezeichnung">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kuerzel">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="he_nr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="mu_nr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kp_nr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="isybau">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="m150">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="m145">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kommentar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" index="0" name=""/>
    <alias field="bezeichnung" index="1" name="Bezeichnung"/>
    <alias field="kuerzel" index="2" name="Kürzel"/>
    <alias field="he_nr" index="3" name="Bez (HYSTEM-EXTRAN)"/>
    <alias field="mu_nr" index="4" name="Bez (MIKE)"/>
    <alias field="kp_nr" index="5" name="Bez (Kanal++)"/>
    <alias field="isybau" index="6" name="Bez (ISYBAU)"/>
    <alias field="m150" index="7" name="Bez (DWA_M 145)"/>
    <alias field="m145" index="8" name="Bez (DWA-M 150)"/>
    <alias field="kommentar" index="9" name="Kommentar"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="bezeichnung"/>
    <default expression="" applyOnUpdate="0" field="kuerzel"/>
    <default expression="" applyOnUpdate="0" field="he_nr"/>
    <default expression="" applyOnUpdate="0" field="mu_nr"/>
    <default expression="" applyOnUpdate="0" field="kp_nr"/>
    <default expression="" applyOnUpdate="0" field="isybau"/>
    <default expression="" applyOnUpdate="0" field="m150"/>
    <default expression="" applyOnUpdate="0" field="m145"/>
    <default expression="" applyOnUpdate="0" field="kommentar"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="2" exp_strength="0" field="pk" constraints="3" unique_strength="2"/>
    <constraint notnull_strength="0" exp_strength="0" field="bezeichnung" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kuerzel" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="he_nr" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="mu_nr" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kp_nr" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="isybau" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="m150" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="m145" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kommentar" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="bezeichnung"/>
    <constraint exp="" desc="" field="kuerzel"/>
    <constraint exp="" desc="" field="he_nr"/>
    <constraint exp="" desc="" field="mu_nr"/>
    <constraint exp="" desc="" field="kp_nr"/>
    <constraint exp="" desc="" field="isybau"/>
    <constraint exp="" desc="" field="m150"/>
    <constraint exp="" desc="" field="m145"/>
    <constraint exp="" desc="" field="kommentar"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" type="field" width="-1" name="pk"/>
      <column hidden="0" type="field" width="-1" name="bezeichnung"/>
      <column hidden="0" type="field" width="-1" name="he_nr"/>
      <column hidden="0" type="field" width="-1" name="mu_nr"/>
      <column hidden="0" type="field" width="-1" name="kp_nr"/>
      <column hidden="0" type="field" width="-1" name="kuerzel"/>
      <column hidden="0" type="field" width="-1" name="isybau"/>
      <column hidden="0" type="field" width="-1" name="m150"/>
      <column hidden="0" type="field" width="-1" name="m145"/>
      <column hidden="0" type="field" width="-1" name="kommentar"/>
      <column hidden="1" type="actions" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <editable>
    <field editable="1" name="bezeichnung"/>
    <field editable="1" name="he_nr"/>
    <field editable="1" name="isybau"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="kp_nr"/>
    <field editable="1" name="kuerzel"/>
    <field editable="1" name="m145"/>
    <field editable="1" name="m150"/>
    <field editable="1" name="mu_nr"/>
    <field editable="1" name="pk"/>
  </editable>
  <labelOnTop>
    <field name="bezeichnung" labelOnTop="0"/>
    <field name="he_nr" labelOnTop="0"/>
    <field name="isybau" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="kp_nr" labelOnTop="0"/>
    <field name="kuerzel" labelOnTop="0"/>
    <field name="m145" labelOnTop="0"/>
    <field name="m150" labelOnTop="0"/>
    <field name="mu_nr" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="bezeichnung"/>
    <field reuseLastValue="0" name="he_nr"/>
    <field reuseLastValue="0" name="isybau"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="kp_nr"/>
    <field reuseLastValue="0" name="kuerzel"/>
    <field reuseLastValue="0" name="m145"/>
    <field reuseLastValue="0" name="m150"/>
    <field reuseLastValue="0" name="mu_nr"/>
    <field reuseLastValue="0" name="pk"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"bezeichnung"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
