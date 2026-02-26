<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" minScale="0" version="3.28.13-Firenze" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal durationField="pk" accumulate="0" enabled="0" durationUnit="min" startExpression="" fixedDuration="0" mode="0" limitMode="0" endExpression="" startField="" endField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option type="QString" name="QFieldSync/action" value="copy"/>
      <Option type="QString" name="QFieldSync/attachment_naming" value="{}"/>
      <Option type="QString" name="QFieldSync/cloud_action" value="offline"/>
      <Option type="QString" name="QFieldSync/geometry_locked_expression" value=""/>
      <Option type="QString" name="QFieldSync/photo_naming" value="{}"/>
      <Option type="QString" name="QFieldSync/relationship_maximum_visible" value="{}"/>
      <Option type="int" name="QFieldSync/tracking_distance_requirement_minimum_meters" value="30"/>
      <Option type="int" name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" value="1"/>
      <Option type="int" name="QFieldSync/tracking_measurement_type" value="0"/>
      <Option type="int" name="QFieldSync/tracking_time_requirement_interval_seconds" value="30"/>
      <Option type="int" name="QFieldSync/value_map_button_interface_threshold" value="0"/>
      <Option type="List" name="dualview/previewExpressions">
        <Option type="QString" value="&quot;kuerzel&quot;"/>
      </Option>
      <Option type="int" name="embeddedWidgets/count" value="0"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector" showLabelLegend="0"/>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bezeichnung" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kuerzel" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="he_nr" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kp_nr" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="isybau" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="m150" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="m145" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bemerkung" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Bezeichnung" index="1" field="bezeichnung"/>
    <alias name="Kürzel" index="2" field="kuerzel"/>
    <alias name="Bez (HYSTEM-EXTRAN)" index="3" field="he_nr"/>
    <alias name="Bez (Kanal++)" index="4" field="kp_nr"/>
    <alias name="Bez (ISYBAU)" index="5" field="isybau"/>
    <alias name="Bez (DWA-M 150)" index="6" field="m150"/>
    <alias name="Bez (DWA-M 145)" index="7" field="m145"/>
    <alias name="Bemerkung" index="8" field="bemerkung"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="bezeichnung"/>
    <default applyOnUpdate="0" expression="" field="kuerzel"/>
    <default applyOnUpdate="0" expression="" field="he_nr"/>
    <default applyOnUpdate="0" expression="" field="kp_nr"/>
    <default applyOnUpdate="0" expression="" field="isybau"/>
    <default applyOnUpdate="0" expression="" field="m150"/>
    <default applyOnUpdate="0" expression="" field="m145"/>
    <default applyOnUpdate="0" expression="" field="bemerkung"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="2" constraints="3" notnull_strength="2" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bezeichnung"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kuerzel"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="he_nr"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kp_nr"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="isybau"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="m150"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="m145"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bemerkung"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="bezeichnung"/>
    <constraint exp="" desc="" field="kuerzel"/>
    <constraint exp="" desc="" field="he_nr"/>
    <constraint exp="" desc="" field="kp_nr"/>
    <constraint exp="" desc="" field="isybau"/>
    <constraint exp="" desc="" field="m150"/>
    <constraint exp="" desc="" field="m145"/>
    <constraint exp="" desc="" field="bemerkung"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column width="-1" type="field" name="pk" hidden="0"/>
      <column width="-1" type="field" name="bezeichnung" hidden="0"/>
      <column width="-1" type="field" name="kuerzel" hidden="0"/>
      <column width="139" type="field" name="he_nr" hidden="0"/>
      <column width="-1" type="field" name="kp_nr" hidden="0"/>
      <column width="-1" type="field" name="isybau" hidden="0"/>
      <column width="-1" type="field" name="m150" hidden="0"/>
      <column width="-1" type="field" name="m145" hidden="0"/>
      <column width="194" type="field" name="bemerkung" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
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
    <field editable="1" name="bemerkung"/>
    <field editable="1" name="bezeichnung"/>
    <field editable="1" name="druckdicht"/>
    <field editable="1" name="he_nr"/>
    <field editable="1" name="isybau"/>
    <field editable="1" name="kp_nr"/>
    <field editable="1" name="kuerzel"/>
    <field editable="1" name="m145"/>
    <field editable="1" name="m150"/>
    <field editable="1" name="pk"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="bemerkung"/>
    <field labelOnTop="0" name="bezeichnung"/>
    <field labelOnTop="0" name="druckdicht"/>
    <field labelOnTop="0" name="he_nr"/>
    <field labelOnTop="0" name="isybau"/>
    <field labelOnTop="0" name="kp_nr"/>
    <field labelOnTop="0" name="kuerzel"/>
    <field labelOnTop="0" name="m145"/>
    <field labelOnTop="0" name="m150"/>
    <field labelOnTop="0" name="pk"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="bemerkung" reuseLastValue="0"/>
    <field name="bezeichnung" reuseLastValue="0"/>
    <field name="druckdicht" reuseLastValue="0"/>
    <field name="he_nr" reuseLastValue="0"/>
    <field name="isybau" reuseLastValue="0"/>
    <field name="kp_nr" reuseLastValue="0"/>
    <field name="kuerzel" reuseLastValue="0"/>
    <field name="m145" reuseLastValue="0"/>
    <field name="m150" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"kuerzel"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
