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
    <field name="objname" configurationFlags="None">
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
    <alias name="Warntext" index="1" field="warntext"/>
    <alias name="Warntyp" index="2" field="warntyp"/>
    <alias name="Warnlevel" index="3" field="warnlevel"/>
    <alias name="Layername" index="4" field="layername"/>
    <alias name="Attributname" index="5" field="attrname"/>
    <alias name="Objektname" index="6" field="objname"/>
    <alias name="bearbeitet" index="7" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="warntext"/>
    <default applyOnUpdate="0" expression="" field="warntyp"/>
    <default applyOnUpdate="0" expression="" field="warnlevel"/>
    <default applyOnUpdate="0" expression="" field="layername"/>
    <default applyOnUpdate="0" expression="" field="attrname"/>
    <default applyOnUpdate="0" expression="" field="objname"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint unique_strength="2" notnull_strength="2" exp_strength="0" constraints="3" field="pk"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="warntext"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="warntyp"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="warnlevel"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="layername"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="attrname"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="objname"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="warntext"/>
    <constraint exp="" desc="" field="warntyp"/>
    <constraint exp="" desc="" field="warnlevel"/>
    <constraint exp="" desc="" field="layername"/>
    <constraint exp="" desc="" field="attrname"/>
    <constraint exp="" desc="" field="objname"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting name="Zoom/Pan zum Objekt" capture="1" isEnabledOnlyWhenEditable="0" shortTitle="Zoom/Pan zum Objekt" action="from qgis.PyQt import QtWidgets&#xa;from qgis.core import Qgis&#xa;&#xa;obj = '[%objname%]'&#xa;attr = '[%attrname%]'&#xa;&#xa;activeproject = QgsProject().instance()&#xa;layername = '[%layername%]'&#xa;clayers = activeproject.mapLayersByName(layername)&#xa;if not clayers:&#xa;    QtWidgets.QMessageBox.information(None, &quot;Fehler im Programmcode der Aktion&quot;, f'Layer &quot;{layername}&quot;nicht definiert')&#xa;else:&#xa;    clayer = clayers[0]&#xa;    clayer.selectByExpression(f&quot;{attr} = '{obj}'&quot;)&#xa;    qgis.utils.iface.setActiveLayer(clayer)&#xa;    qgis.utils.iface.actionZoomToSelected().trigger()&#xa;" id="{ce7efdcf-811f-4b6b-859e-b64a436a7a74}" icon="C:/FHAC/hoettges/Kanalprogramme/QKan/qkan/datacheck/jump.png" type="1" notificationMessage="">
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="buttonList" sortExpression="">
    <columns>
      <column hidden="0" width="57" type="actions"/>
      <column name="pk" hidden="1" width="38" type="field"/>
      <column name="warnlevel" hidden="0" width="82" type="field"/>
      <column name="warntext" hidden="0" width="93" type="field"/>
      <column name="layername" hidden="0" width="165" type="field"/>
      <column name="objname" hidden="0" width="99" type="field"/>
      <column name="warntyp" hidden="0" width="168" type="field"/>
      <column name="attrname" hidden="0" width="-1" type="field"/>
      <column name="createdat" hidden="0" width="159" type="field"/>
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
    <field name="attrname" editable="1"/>
    <field name="beschreibung" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="gruppe" editable="1"/>
    <field name="idname" editable="1"/>
    <field name="layername" editable="1"/>
    <field name="name" editable="1"/>
    <field name="objname" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="warnlevel" editable="1"/>
    <field name="warntext" editable="1"/>
    <field name="warntyp" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="attrname" labelOnTop="0"/>
    <field name="beschreibung" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="gruppe" labelOnTop="0"/>
    <field name="idname" labelOnTop="0"/>
    <field name="layername" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="objname" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="warnlevel" labelOnTop="0"/>
    <field name="warntext" labelOnTop="0"/>
    <field name="warntyp" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="attrname" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="layername" reuseLastValue="0"/>
    <field name="objname" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
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
