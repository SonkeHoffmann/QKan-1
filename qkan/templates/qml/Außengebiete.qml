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
            <Option name="color" value="225,89,137,255" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.26" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="style" value="solid" type="QString"/>
          </Option>
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="225,89,137,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="solid"/>
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
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="gebnam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="schnam" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="Description" value="" type="QString"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="schnam" type="QString"/>
            <Option name="Layer" value="schaechte20161220162259105" type="QString"/>
            <Option name="LayerName" value="Schächte" type="QString"/>
            <Option name="LayerProviderName" value="spatialite" type="QString"/>
            <Option name="LayerSource" value="dbname='itwh.sqlite' table=&quot;schaechte&quot; (geop) sql=schachttyp = 'Schacht'" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="schnam" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hoeheob" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hoeheun" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="fliessweg" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="basisabfluss" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cn" configurationFlags="None">
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
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="Description" value="" type="QString"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="tgnam" type="QString"/>
            <Option name="Layer" value="Teilgebiete_786fa926_704f_4cb1_bc67_eb8571f2f6c0" type="QString"/>
            <Option name="LayerName" value="Teilgebiete" type="QString"/>
            <Option name="LayerProviderName" value="spatialite" type="QString"/>
            <Option name="LayerSource" value="dbname='itwh.sqlite' table=&quot;teilgebiete&quot; (geom)" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="tgnam" type="QString"/>
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
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Name" index="1" field="gebnam"/>
    <alias name="Schacht" index="2" field="schnam"/>
    <alias name="" index="3" field="hoeheob"/>
    <alias name="" index="4" field="hoeheun"/>
    <alias name="Fließweg" index="5" field="fliessweg"/>
    <alias name="Basisabfluss" index="6" field="basisabfluss"/>
    <alias name="CN" index="7" field="cn"/>
    <alias name="Regenschreiber" index="8" field="regenschreiber"/>
    <alias name="Teilgebiet" index="9" field="teilgebiet"/>
    <alias name="Kommentar" index="10" field="kommentar"/>
    <alias name="bearbeitet" index="11" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="gebnam"/>
    <default applyOnUpdate="0" expression="" field="schnam"/>
    <default applyOnUpdate="0" expression="" field="hoeheob"/>
    <default applyOnUpdate="0" expression="" field="hoeheun"/>
    <default applyOnUpdate="0" expression="" field="fliessweg"/>
    <default applyOnUpdate="0" expression="" field="basisabfluss"/>
    <default applyOnUpdate="0" expression="" field="cn"/>
    <default applyOnUpdate="0" expression="" field="regenschreiber"/>
    <default applyOnUpdate="0" expression="" field="teilgebiet"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint unique_strength="2" notnull_strength="2" exp_strength="0" constraints="3" field="pk"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="gebnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="schnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="hoeheob"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="hoeheun"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="fliessweg"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="basisabfluss"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="cn"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="regenschreiber"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="teilgebiet"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="kommentar"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="gebnam"/>
    <constraint exp="" desc="" field="schnam"/>
    <constraint exp="" desc="" field="hoeheob"/>
    <constraint exp="" desc="" field="hoeheun"/>
    <constraint exp="" desc="" field="fliessweg"/>
    <constraint exp="" desc="" field="basisabfluss"/>
    <constraint exp="" desc="" field="cn"/>
    <constraint exp="" desc="" field="regenschreiber"/>
    <constraint exp="" desc="" field="teilgebiet"/>
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
      <column name="gebnam" hidden="0" width="-1" type="field"/>
      <column name="schnam" hidden="0" width="-1" type="field"/>
      <column name="hoeheob" hidden="0" width="-1" type="field"/>
      <column name="hoeheun" hidden="0" width="-1" type="field"/>
      <column name="fliessweg" hidden="0" width="-1" type="field"/>
      <column name="basisabfluss" hidden="0" width="-1" type="field"/>
      <column name="cn" hidden="0" width="-1" type="field"/>
      <column name="regenschreiber" hidden="0" width="-1" type="field"/>
      <column name="teilgebiet" hidden="0" width="-1" type="field"/>
      <column name="kommentar" hidden="0" width="-1" type="field"/>
      <column name="createdat" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\qkan_aussengebiete.ui</editform>
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
    <field name="basisabfluss" editable="1"/>
    <field name="cn" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="fliessweg" editable="1"/>
    <field name="gebnam" editable="1"/>
    <field name="hoeheob" editable="1"/>
    <field name="hoeheun" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="regenschreiber" editable="1"/>
    <field name="schnam" editable="1"/>
    <field name="teilgebiet" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="basisabfluss" labelOnTop="0"/>
    <field name="cn" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="fliessweg" labelOnTop="0"/>
    <field name="gebnam" labelOnTop="0"/>
    <field name="hoeheob" labelOnTop="0"/>
    <field name="hoeheun" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="regenschreiber" labelOnTop="0"/>
    <field name="schnam" labelOnTop="0"/>
    <field name="teilgebiet" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="basisabfluss" reuseLastValue="0"/>
    <field name="cn" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="fliessweg" reuseLastValue="0"/>
    <field name="gebnam" reuseLastValue="0"/>
    <field name="hoeheob" reuseLastValue="0"/>
    <field name="hoeheun" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="regenschreiber" reuseLastValue="0"/>
    <field name="schnam" reuseLastValue="0"/>
    <field name="teilgebiet" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"gebnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
