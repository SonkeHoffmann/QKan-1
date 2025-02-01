<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Temporal|Notes" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" readOnly="0" minScale="0" symbologyReferenceScale="-1" maxScale="0" simplifyDrawingHints="1" simplifyLocal="1" version="3.22.16-Białowieża" simplifyMaxScale="1" simplifyDrawingTol="1" labelsEnabled="0">
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
      <symbol force_rhr="0" name="0" type="fill" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleFill">
          <Option type="Map">
            <Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="color" value="116,161,198,255" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="221,219,80,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.8" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="style" value="no" type="QString"/>
          </Option>
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="116,161,198,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="221,219,80,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.8"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="no"/>
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
    <field name="flnam" configurationFlags="None">
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
    <field name="neigkl" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="neigung" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="befgrad" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="schwerpunktlaufzeit" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="regenschreiber" configurationFlags="None">
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
            <Option name="Description" value="&quot;kommentar&quot;" type="QString"/>
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
    <field name="abflussparameter" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Description" value="&quot;kommentar&quot;" type="QString"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="apnam" type="QString"/>
            <Option name="Layer" value="Abflussparameter_KP_e16f4a36_8f43_4398_a67c_53cbd2e8d3e9" type="QString"/>
            <Option name="LayerName" value="Abflussparameter HE" type="QString"/>
            <Option name="LayerProviderName" value="spatialite" type="QString"/>
            <Option name="LayerSource" value="dbname='itwh.sqlite' table=&quot;abflussparameter&quot;" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="true" type="bool"/>
            <Option name="Value" value="apnam" type="QString"/>
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
    <alias name="Name" index="1" field="flnam"/>
    <alias name="Haltung" index="2" field="haltnam"/>
    <alias name="Schacht" index="3" field="schnam"/>
    <alias name="Neigungsklasse" index="4" field="neigkl"/>
    <alias name="Neigung" index="5" field="neigung"/>
    <alias name="Befestigungsgrad" index="6" field="befgrad"/>
    <alias name="Schwerpunktlaufzeit" index="7" field="schwerpunktlaufzeit"/>
    <alias name="Regenschreiber" index="8" field="regenschreiber"/>
    <alias name="Teilgebiet" index="9" field="teilgebiet"/>
    <alias name="Abflussparameter" index="10" field="abflussparameter"/>
    <alias name="Kommentar" index="11" field="kommentar"/>
    <alias name="bearbeitet" index="12" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="flnam"/>
    <default applyOnUpdate="0" expression="" field="haltnam"/>
    <default applyOnUpdate="0" expression="" field="schnam"/>
    <default applyOnUpdate="0" expression="" field="neigkl"/>
    <default applyOnUpdate="0" expression="" field="neigung"/>
    <default applyOnUpdate="0" expression="" field="befgrad"/>
    <default applyOnUpdate="0" expression="" field="schwerpunktlaufzeit"/>
    <default applyOnUpdate="0" expression="" field="regenschreiber"/>
    <default applyOnUpdate="0" expression="" field="teilgebiet"/>
    <default applyOnUpdate="0" expression="" field="abflussparameter"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint unique_strength="2" notnull_strength="2" exp_strength="0" constraints="3" field="pk"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="flnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="haltnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="schnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="neigkl"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="neigung"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="befgrad"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="schwerpunktlaufzeit"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="regenschreiber"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="teilgebiet"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="abflussparameter"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="kommentar"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="flnam"/>
    <constraint exp="" desc="" field="haltnam"/>
    <constraint exp="" desc="" field="schnam"/>
    <constraint exp="" desc="" field="neigkl"/>
    <constraint exp="" desc="" field="neigung"/>
    <constraint exp="" desc="" field="befgrad"/>
    <constraint exp="" desc="" field="schwerpunktlaufzeit"/>
    <constraint exp="" desc="" field="regenschreiber"/>
    <constraint exp="" desc="" field="teilgebiet"/>
    <constraint exp="" desc="" field="abflussparameter"/>
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
      <column name="flnam" hidden="0" width="-1" type="field"/>
      <column name="haltnam" hidden="0" width="-1" type="field"/>
      <column name="neigkl" hidden="0" width="-1" type="field"/>
      <column name="regenschreiber" hidden="0" width="-1" type="field"/>
      <column name="teilgebiet" hidden="0" width="-1" type="field"/>
      <column name="abflussparameter" hidden="0" width="124" type="field"/>
      <column name="kommentar" hidden="0" width="-1" type="field"/>
      <column name="createdat" hidden="0" width="-1" type="field"/>
      <column name="schnam" hidden="0" width="-1" type="field"/>
      <column name="neigung" hidden="0" width="-1" type="field"/>
      <column name="befgrad" hidden="0" width="-1" type="field"/>
      <column name="schwerpunktlaufzeit" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
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
    <field name="abflussparameter" editable="1"/>
    <field name="befgrad" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="flnam" editable="1"/>
    <field name="haltnam" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="neigkl" editable="1"/>
    <field name="neigung" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="regenschreiber" editable="1"/>
    <field name="schnam" editable="1"/>
    <field name="schwerpunktlaufzeit" editable="1"/>
    <field name="teilgebiet" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="abflussparameter" labelOnTop="0"/>
    <field name="befgrad" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="flnam" labelOnTop="0"/>
    <field name="haltnam" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="neigkl" labelOnTop="0"/>
    <field name="neigung" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="regenschreiber" labelOnTop="0"/>
    <field name="schnam" labelOnTop="0"/>
    <field name="schwerpunktlaufzeit" labelOnTop="0"/>
    <field name="teilgebiet" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="abflussparameter" reuseLastValue="0"/>
    <field name="befgrad" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="flnam" reuseLastValue="0"/>
    <field name="haltnam" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="neigkl" reuseLastValue="0"/>
    <field name="neigung" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="regenschreiber" reuseLastValue="0"/>
    <field name="schnam" reuseLastValue="0"/>
    <field name="schwerpunktlaufzeit" reuseLastValue="0"/>
    <field name="teilgebiet" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"flnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
