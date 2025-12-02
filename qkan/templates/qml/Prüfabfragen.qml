<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" minScale="1e+08" version="3.28.13-Firenze" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal durationField="" accumulate="0" enabled="0" durationUnit="min" startExpression="" fixedDuration="0" mode="0" limitMode="0" endExpression="" startField="" endField="">
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
        <Option type="QString" value="&quot;warntext&quot;"/>
        <Option type="QString" value="&quot;name&quot;"/>
        <Option type="QString" value="&quot;warntext&quot;"/>
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
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="gruppe" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="warntext" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="warntyp" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="warnlevel" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="sql" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="layername" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="attrname" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Gruppe" index="1" field="gruppe"/>
    <alias name="Warntext" index="2" field="warntext"/>
    <alias name="Warntyp" index="3" field="warntyp"/>
    <alias name="Warnlevel" index="4" field="warnlevel"/>
    <alias name="" index="5" field="sql"/>
    <alias name="Layername" index="6" field="layername"/>
    <alias name="Attributname" index="7" field="attrname"/>
    <alias name="" index="8" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="gruppe"/>
    <default applyOnUpdate="0" expression="" field="warntext"/>
    <default applyOnUpdate="0" expression="" field="warntyp"/>
    <default applyOnUpdate="0" expression="" field="warnlevel"/>
    <default applyOnUpdate="0" expression="" field="sql"/>
    <default applyOnUpdate="0" expression="" field="layername"/>
    <default applyOnUpdate="0" expression="" field="attrname"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="2" constraints="3" notnull_strength="2" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="gruppe"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="warntext"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="warntyp"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="warnlevel"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="sql"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="layername"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="attrname"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createdat"/>
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
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column width="-1" type="field" name="pk" hidden="0"/>
      <column width="-1" type="field" name="gruppe" hidden="0"/>
      <column width="-1" type="field" name="warntext" hidden="0"/>
      <column width="-1" type="field" name="warnlevel" hidden="0"/>
      <column width="159" type="field" name="sql" hidden="0"/>
      <column width="-1" type="field" name="layername" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column width="-1" type="field" name="warntyp" hidden="0"/>
      <column width="-1" type="field" name="createdat" hidden="0"/>
      <column width="-1" type="field" name="attrname" hidden="0"/>
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
    <field labelOnTop="0" name="attrname"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="gruppe"/>
    <field labelOnTop="0" name="idname"/>
    <field labelOnTop="0" name="layername"/>
    <field labelOnTop="0" name="name"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="sql"/>
    <field labelOnTop="0" name="warnlevel"/>
    <field labelOnTop="0" name="warntext"/>
    <field labelOnTop="0" name="warntyp"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="attrname" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="gruppe" reuseLastValue="0"/>
    <field name="layername" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="sql" reuseLastValue="0"/>
    <field name="warnlevel" reuseLastValue="0"/>
    <field name="warntext" reuseLastValue="0"/>
    <field name="warntyp" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"warntext"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
