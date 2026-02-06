<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" minScale="0" simplifyDrawingHints="1" symbologyReferenceScale="-1" simplifyDrawingTol="1" simplifyLocal="1" labelsEnabled="0" simplifyAlgorithm="0" version="3.28.13-Firenze" simplifyMaxScale="1" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes">
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
  <renderer-v2 symbollevels="0" forceraster="0" referencescale="-1" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol type="fill" clip_to_extent="1" name="0" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleFill" locked="0">
          <Option type="Map">
            <Option type="QString" name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="color" value="225,89,137,255"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="35,35,35,255"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0.26"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="style" value="solid"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
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
      <Option type="int" name="embeddedWidgets/count" value="0"/>
      <Option type="invalid" name="variableNames"/>
      <Option type="invalid" name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration type="Map">
      <Option type="Map" name="QgsGeometryGapCheck">
        <Option type="double" name="allowedGapsBuffer" value="0"/>
        <Option type="bool" name="allowedGapsEnabled" value="false"/>
        <Option type="QString" name="allowedGapsLayer" value=""/>
      </Option>
    </checkConfiguration>
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
    <field name="gebnam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="schnam" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="schnam"/>
            <Option type="QString" name="Layer" value="knotentyp_20161204084617148"/>
            <Option type="QString" name="LayerName" value="Knotentyp"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='demo.sqlite' table=&quot;schaechte&quot; (geop)"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="schnam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hoeheob" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
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
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="basisabfluss" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cn" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="regenschreiber" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="teilgebiet" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="tgnam"/>
            <Option type="QString" name="Layer" value="Teilgebiete_786fa926_704f_4cb1_bc67_eb8571f2f6c0"/>
            <Option type="QString" name="LayerName" value="Teilgebiete"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='demo.sqlite' table=&quot;teilgebiete&quot; (geom)"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="tgnam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
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
    <constraint exp_strength="0" unique_strength="2" constraints="3" notnull_strength="2" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="gebnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="schnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="hoeheob"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="hoeheun"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="fliessweg"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="basisabfluss"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="cn"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="regenschreiber"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="teilgebiet"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kommentar"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createdat"/>
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
      <column width="-1" type="field" name="pk" hidden="0"/>
      <column width="-1" type="field" name="gebnam" hidden="0"/>
      <column width="-1" type="field" name="schnam" hidden="0"/>
      <column width="-1" type="field" name="hoeheob" hidden="0"/>
      <column width="-1" type="field" name="hoeheun" hidden="0"/>
      <column width="-1" type="field" name="fliessweg" hidden="0"/>
      <column width="-1" type="field" name="basisabfluss" hidden="0"/>
      <column width="-1" type="field" name="cn" hidden="0"/>
      <column width="-1" type="field" name="regenschreiber" hidden="0"/>
      <column width="-1" type="field" name="teilgebiet" hidden="0"/>
      <column width="-1" type="field" name="kommentar" hidden="0"/>
      <column width="-1" type="field" name="createdat" hidden="0"/>
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
    <field editable="1" name="basisabfluss"/>
    <field editable="1" name="cn"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="fliessweg"/>
    <field editable="1" name="gebnam"/>
    <field editable="1" name="hoeheob"/>
    <field editable="1" name="hoeheun"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="regenschreiber"/>
    <field editable="1" name="schnam"/>
    <field editable="1" name="teilgebiet"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="basisabfluss"/>
    <field labelOnTop="0" name="cn"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="fliessweg"/>
    <field labelOnTop="0" name="gebnam"/>
    <field labelOnTop="0" name="hoeheob"/>
    <field labelOnTop="0" name="hoeheun"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="regenschreiber"/>
    <field labelOnTop="0" name="schnam"/>
    <field labelOnTop="0" name="teilgebiet"/>
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
