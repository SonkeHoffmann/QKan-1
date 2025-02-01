<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Temporal|Notes" hasScaleBasedVisibilityFlag="0" readOnly="0" minScale="0" maxScale="0" version="3.22.16-Białowieża">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal limitMode="0" enabled="0" fixedDuration="0" startExpression="" endExpression="" mode="0" durationField="" startField="" accumulate="0" endField="" durationUnit="min">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option name="QFieldSync/action" value="copy" type="QString"/>
      <Option name="QFieldSync/attachment_naming" value="{}" type="QString"/>
      <Option name="QFieldSync/cloud_action" value="offline" type="QString"/>
      <Option name="QFieldSync/geometry_locked_expression" value="" type="QString"/>
      <Option name="QFieldSync/photo_naming" value="{}" type="QString"/>
      <Option name="QFieldSync/relationship_maximum_visible" value="{}" type="QString"/>
      <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" value="30" type="int"/>
      <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" value="1" type="int"/>
      <Option name="QFieldSync/tracking_measurement_type" value="0" type="int"/>
      <Option name="QFieldSync/tracking_time_requirement_interval_seconds" value="30" type="int"/>
      <Option name="QFieldSync/value_map_button_interface_threshold" value="0" type="int"/>
      <Option name="dualview/previewExpressions" type="List">
        <Option value="&quot;bezeichnung&quot;" type="QString"/>
      </Option>
      <Option name="embeddedWidgets/count" value="0" type="int"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bezeichnung" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kuerzel" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="he_nr" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="mu_nr" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kp_nr" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="isybau" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="m150" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="m145" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Bezeichnung" index="1" field="bezeichnung"/>
    <alias name="" index="2" field="kuerzel"/>
    <alias name="NR (HYSTEM-EXTRAN)" index="3" field="he_nr"/>
    <alias name="NR (Mike Urban)" index="4" field="mu_nr"/>
    <alias name="NR (Kanal++)" index="5" field="kp_nr"/>
    <alias name="" index="6" field="isybau"/>
    <alias name="" index="7" field="m150"/>
    <alias name="" index="8" field="m145"/>
    <alias name="" index="9" field="kommentar"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="bezeichnung"/>
    <default applyOnUpdate="0" expression="" field="kuerzel"/>
    <default applyOnUpdate="0" expression="" field="he_nr"/>
    <default applyOnUpdate="0" expression="" field="mu_nr"/>
    <default applyOnUpdate="0" expression="" field="kp_nr"/>
    <default applyOnUpdate="0" expression="" field="isybau"/>
    <default applyOnUpdate="0" expression="" field="m150"/>
    <default applyOnUpdate="0" expression="" field="m145"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
  </defaults>
  <constraints>
    <constraint unique_strength="2" notnull_strength="2" exp_strength="0" constraints="3" field="pk"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="bezeichnung"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="kuerzel"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="he_nr"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="mu_nr"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="kp_nr"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="isybau"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="m150"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="m145"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="kommentar"/>
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
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column name="pk" hidden="0" width="-1" type="field"/>
      <column name="bezeichnung" hidden="0" width="-1" type="field"/>
      <column name="he_nr" hidden="0" width="-1" type="field"/>
      <column name="mu_nr" hidden="0" width="-1" type="field"/>
      <column name="kp_nr" hidden="0" width="-1" type="field"/>
      <column name="kuerzel" hidden="0" width="-1" type="field"/>
      <column name="isybau" hidden="0" width="-1" type="field"/>
      <column name="m150" hidden="0" width="-1" type="field"/>
      <column name="m145" hidden="0" width="-1" type="field"/>
      <column name="kommentar" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\qkan_simulationsstatus.ui</editform>
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
    <field name="bezeichnung" editable="1"/>
    <field name="he_nr" editable="1"/>
    <field name="isybau" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="kp_nr" editable="1"/>
    <field name="kuerzel" editable="1"/>
    <field name="m145" editable="1"/>
    <field name="m150" editable="1"/>
    <field name="mu_nr" editable="1"/>
    <field name="pk" editable="1"/>
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
    <field name="bezeichnung" reuseLastValue="0"/>
    <field name="he_nr" reuseLastValue="0"/>
    <field name="isybau" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="kp_nr" reuseLastValue="0"/>
    <field name="kuerzel" reuseLastValue="0"/>
    <field name="m145" reuseLastValue="0"/>
    <field name="m150" reuseLastValue="0"/>
    <field name="mu_nr" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"bezeichnung"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
