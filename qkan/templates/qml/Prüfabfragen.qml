<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes" hasScaleBasedVisibilityFlag="0" minScale="1e+08" version="3.28.15-Firenze" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endField="" accumulate="0" startField="" endExpression="" fixedDuration="0" mode="0" limitMode="0" durationField="" enabled="0" durationUnit="min" startExpression="">
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
        <Option value="&quot;warntext&quot;" type="QString"/>
        <Option value="&quot;name&quot;" type="QString"/>
        <Option value="&quot;warntext&quot;" type="QString"/>
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
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="gruppe">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="warntext">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="warntyp">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="warnlevel">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="sql">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="layername">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="attrname">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="createdat">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" index="0" name=""/>
    <alias field="gruppe" index="1" name="Gruppe"/>
    <alias field="warntext" index="2" name="Warntext"/>
    <alias field="warntyp" index="3" name="Warntyp"/>
    <alias field="warnlevel" index="4" name="Warnlevel"/>
    <alias field="sql" index="5" name=""/>
    <alias field="layername" index="6" name="Layername"/>
    <alias field="attrname" index="7" name="Attributname"/>
    <alias field="createdat" index="8" name=""/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="gruppe"/>
    <default expression="" applyOnUpdate="0" field="warntext"/>
    <default expression="" applyOnUpdate="0" field="warntyp"/>
    <default expression="" applyOnUpdate="0" field="warnlevel"/>
    <default expression="" applyOnUpdate="0" field="sql"/>
    <default expression="" applyOnUpdate="0" field="layername"/>
    <default expression="" applyOnUpdate="0" field="attrname"/>
    <default expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" applyOnUpdate="0" field="createdat"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="2" exp_strength="0" field="pk" constraints="3" unique_strength="2"/>
    <constraint notnull_strength="0" exp_strength="0" field="gruppe" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="warntext" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="warntyp" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="warnlevel" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="sql" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="layername" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="attrname" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="createdat" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="gruppe"/>
    <constraint exp="" desc="" field="warntext"/>
    <constraint exp="" desc="" field="warntyp"/>
    <constraint exp="" desc="" field="warnlevel"/>
    <constraint exp="" desc="" field="sql"/>
    <constraint exp="" desc="" field="layername"/>
    <constraint exp="" desc="" field="attrname"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" type="field" width="-1" name="pk"/>
      <column hidden="0" type="field" width="-1" name="gruppe"/>
      <column hidden="0" type="field" width="-1" name="warntext"/>
      <column hidden="0" type="field" width="-1" name="warnlevel"/>
      <column hidden="0" type="field" width="159" name="sql"/>
      <column hidden="0" type="field" width="-1" name="layername"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" type="field" width="-1" name="warntyp"/>
      <column hidden="0" type="field" width="-1" name="createdat"/>
      <column hidden="0" type="field" width="-1" name="attrname"/>
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
    <field editable="1" name="attrname"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="gruppe"/>
    <field editable="1" name="idname"/>
    <field editable="1" name="layername"/>
    <field editable="1" name="name"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="sql"/>
    <field editable="1" name="warnlevel"/>
    <field editable="1" name="warntext"/>
    <field editable="1" name="warntyp"/>
  </editable>
  <labelOnTop>
    <field name="attrname" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="gruppe" labelOnTop="0"/>
    <field name="idname" labelOnTop="0"/>
    <field name="layername" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="sql" labelOnTop="0"/>
    <field name="warnlevel" labelOnTop="0"/>
    <field name="warntext" labelOnTop="0"/>
    <field name="warntyp" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="attrname"/>
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="gruppe"/>
    <field reuseLastValue="0" name="layername"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="sql"/>
    <field reuseLastValue="0" name="warnlevel"/>
    <field reuseLastValue="0" name="warntext"/>
    <field reuseLastValue="0" name="warntyp"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"warntext"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
