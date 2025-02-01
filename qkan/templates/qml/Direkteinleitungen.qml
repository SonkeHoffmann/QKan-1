<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Temporal|Notes" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" readOnly="0" minScale="0" symbologyReferenceScale="-1" maxScale="0" simplifyDrawingHints="0" simplifyLocal="1" version="3.22.16-Białowieża" simplifyMaxScale="1" simplifyDrawingTol="1" labelsEnabled="0">
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
  <renderer-v2 symbollevels="0" referencescale="-1" forceraster="0" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol force_rhr="0" name="0" type="marker" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="188,125,91,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="2" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="188,125,91,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <Option type="Map">
      <Option name="embeddedWidgets/count" value="0" type="int"/>
      <Option name="variableNames" type="invalid"/>
      <Option name="variableValues" type="invalid"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
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
    <field name="elnam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="haltnam" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Description" value="" type="QString"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="haltnam" type="QString"/>
            <Option name="Layer" value="haltungen20161016203756230" type="QString"/>
            <Option name="LayerName" value="Haltungen nach Typ" type="QString"/>
            <Option name="LayerProviderName" value="spatialite" type="QString"/>
            <Option name="LayerSource" value="dbname='itwh.sqlite' table=&quot;haltungen&quot; (geom) sql=haltungstyp IS NULL or haltungstyp = 'Haltung'" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="true" type="bool"/>
            <Option name="Value" value="haltnam" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="schnam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="teilgebiet" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Description" value="" type="QString"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="tgnam" type="QString"/>
            <Option name="Layer" value="Teilgebiete_786fa926_704f_4cb1_bc67_eb8571f2f6c0" type="QString"/>
            <Option name="LayerName" value="Teilgebiete" type="QString"/>
            <Option name="LayerProviderName" value="spatialite" type="QString"/>
            <Option name="LayerSource" value="dbname='itwh.sqlite' table=&quot;teilgebiete&quot; (geom)" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="true" type="bool"/>
            <Option name="Value" value="tgnam" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="zufluss" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ew" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="einzugsgebiet" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" value="true" type="bool"/>
            <Option name="calendar_popup" value="true" type="bool"/>
            <Option name="display_format" value="dd.MM.yyyy HH:mm:ss" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd HH:mm:ss" type="QString"/>
            <Option name="field_iso_format" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Name" index="1" field="elnam"/>
    <alias name="Haltung" index="2" field="haltnam"/>
    <alias name="Schacht" index="3" field="schnam"/>
    <alias name="Teilgebiet" index="4" field="teilgebiet"/>
    <alias name="Zufluss (m³/s)" index="5" field="zufluss"/>
    <alias name="EW" index="6" field="ew"/>
    <alias name="Einzugsgebiet" index="7" field="einzugsgebiet"/>
    <alias name="Kommentar" index="8" field="kommentar"/>
    <alias name="bearbeitet" index="9" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="elnam"/>
    <default applyOnUpdate="0" expression="" field="haltnam"/>
    <default applyOnUpdate="0" expression="" field="schnam"/>
    <default applyOnUpdate="0" expression="" field="teilgebiet"/>
    <default applyOnUpdate="0" expression="" field="zufluss"/>
    <default applyOnUpdate="0" expression="" field="ew"/>
    <default applyOnUpdate="0" expression="" field="einzugsgebiet"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint unique_strength="2" notnull_strength="2" exp_strength="0" constraints="3" field="pk"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="elnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="haltnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="schnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="teilgebiet"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="zufluss"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="ew"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="einzugsgebiet"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="kommentar"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="elnam"/>
    <constraint exp="" desc="" field="haltnam"/>
    <constraint exp="" desc="" field="schnam"/>
    <constraint exp="" desc="" field="teilgebiet"/>
    <constraint exp="" desc="" field="zufluss"/>
    <constraint exp="" desc="" field="ew"/>
    <constraint exp="" desc="" field="einzugsgebiet"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column name="pk" hidden="0" width="-1" type="field"/>
      <column name="elnam" hidden="0" width="-1" type="field"/>
      <column name="haltnam" hidden="0" width="-1" type="field"/>
      <column name="teilgebiet" hidden="0" width="-1" type="field"/>
      <column name="zufluss" hidden="0" width="-1" type="field"/>
      <column name="ew" hidden="0" width="-1" type="field"/>
      <column name="einzugsgebiet" hidden="0" width="-1" type="field"/>
      <column name="kommentar" hidden="0" width="-1" type="field"/>
      <column name="createdat" hidden="0" width="-1" type="field"/>
      <column name="schnam" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\qkan_einleit.ui</editform>
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
    <field name="createdat" editable="1"/>
    <field name="einzugsgebiet" editable="1"/>
    <field name="elnam" editable="1"/>
    <field name="ew" editable="1"/>
    <field name="haltnam" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="schnam" editable="1"/>
    <field name="teilgebiet" editable="1"/>
    <field name="zufluss" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="createdat" labelOnTop="0"/>
    <field name="einzugsgebiet" labelOnTop="0"/>
    <field name="elnam" labelOnTop="0"/>
    <field name="ew" labelOnTop="0"/>
    <field name="haltnam" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="schnam" labelOnTop="0"/>
    <field name="teilgebiet" labelOnTop="0"/>
    <field name="zufluss" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="createdat" reuseLastValue="0"/>
    <field name="einzugsgebiet" reuseLastValue="0"/>
    <field name="elnam" reuseLastValue="0"/>
    <field name="ew" reuseLastValue="0"/>
    <field name="haltnam" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="schnam" reuseLastValue="0"/>
    <field name="teilgebiet" reuseLastValue="0"/>
    <field name="zufluss" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"elnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
