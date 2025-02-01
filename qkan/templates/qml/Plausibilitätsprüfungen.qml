<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Temporal|Notes" hasScaleBasedVisibilityFlag="0" readOnly="0" minScale="1e+08" maxScale="0" version="3.22.16-Białowieża">
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
        <Option value="&quot;name&quot;" type="QString"/>
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
    <constraint unique_strength="2" notnull_strength="2" exp_strength="0" constraints="3" field="pk"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="gruppe"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="warntext"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="warntyp"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="warnlevel"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="sql"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="layername"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="attrname"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="createdat"/>
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
      <column name="pk" hidden="0" width="-1" type="field"/>
      <column name="gruppe" hidden="0" width="-1" type="field"/>
      <column name="warntext" hidden="0" width="-1" type="field"/>
      <column name="warnlevel" hidden="0" width="-1" type="field"/>
      <column name="sql" hidden="0" width="-1" type="field"/>
      <column name="layername" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column name="warntyp" hidden="0" width="-1" type="field"/>
      <column name="createdat" hidden="0" width="-1" type="field"/>
      <column name="attrname" hidden="0" width="-1" type="field"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\forms</editform>
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
    <field name="attrname" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="gruppe" editable="1"/>
    <field name="idname" editable="1"/>
    <field name="layername" editable="1"/>
    <field name="name" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="sql" editable="1"/>
    <field name="warnlevel" editable="1"/>
    <field name="warntext" editable="1"/>
    <field name="warntyp" editable="1"/>
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
  <previewExpression>"name"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
