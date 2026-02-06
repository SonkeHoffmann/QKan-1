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
            <Option type="QString" name="color" value="116,161,198,255"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="221,219,80,255"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0.8"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="style" value="no"/>
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
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flnam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="haltnam" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="haltnam"/>
            <Option type="QString" name="Layer" value="haltungen20161016203756230"/>
            <Option type="QString" name="LayerName" value="Haltungen nach Typ"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='demo.sqlite' table=&quot;haltungen&quot; (geom) sql=haltungstyp IS NULL or haltungstyp = 'Haltung'"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="haltnam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="schnam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="neigkl" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="neigung" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="befgrad" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="schwerpunktlaufzeit" configurationFlags="None">
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
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value="&quot;kommentar&quot;"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="tgnam"/>
            <Option type="QString" name="Layer" value="Teilgebiete_786fa926_704f_4cb1_bc67_eb8571f2f6c0"/>
            <Option type="QString" name="LayerName" value="Teilgebiete"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='demo.sqlite' table=&quot;teilgebiete&quot; (geom)"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="tgnam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="abflussparameter" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value="&quot;kommentar&quot;"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="apnam"/>
            <Option type="QString" name="Layer" value="Abflussparameter_KP_e16f4a36_8f43_4398_a67c_53cbd2e8d3e9"/>
            <Option type="QString" name="LayerName" value="Abflussparameter HE"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='demo.sqlite' table=&quot;abflussparameter&quot;"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="apnam"/>
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
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="dd.MM.yyyy HH:mm:ss"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd HH:mm:ss"/>
            <Option type="bool" name="field_iso_format" value="false"/>
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
    <constraint exp_strength="0" unique_strength="2" constraints="3" notnull_strength="2" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="flnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="haltnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="schnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="neigkl"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="neigung"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="befgrad"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="schwerpunktlaufzeit"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="regenschreiber"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="teilgebiet"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="abflussparameter"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kommentar"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createdat"/>
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
      <column width="-1" type="field" name="pk" hidden="0"/>
      <column width="-1" type="field" name="flnam" hidden="0"/>
      <column width="-1" type="field" name="haltnam" hidden="0"/>
      <column width="-1" type="field" name="neigkl" hidden="0"/>
      <column width="-1" type="field" name="regenschreiber" hidden="0"/>
      <column width="-1" type="field" name="teilgebiet" hidden="0"/>
      <column width="124" type="field" name="abflussparameter" hidden="0"/>
      <column width="-1" type="field" name="kommentar" hidden="0"/>
      <column width="-1" type="field" name="createdat" hidden="0"/>
      <column width="-1" type="field" name="schnam" hidden="0"/>
      <column width="-1" type="field" name="neigung" hidden="0"/>
      <column width="-1" type="field" name="befgrad" hidden="0"/>
      <column width="-1" type="field" name="schwerpunktlaufzeit" hidden="0"/>
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
    <field editable="1" name="abflussparameter"/>
    <field editable="1" name="befgrad"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="flnam"/>
    <field editable="1" name="haltnam"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="neigkl"/>
    <field editable="1" name="neigung"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="regenschreiber"/>
    <field editable="1" name="schnam"/>
    <field editable="1" name="schwerpunktlaufzeit"/>
    <field editable="1" name="teilgebiet"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="abflussparameter"/>
    <field labelOnTop="0" name="befgrad"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="flnam"/>
    <field labelOnTop="0" name="haltnam"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="neigkl"/>
    <field labelOnTop="0" name="neigung"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="regenschreiber"/>
    <field labelOnTop="0" name="schnam"/>
    <field labelOnTop="0" name="schwerpunktlaufzeit"/>
    <field labelOnTop="0" name="teilgebiet"/>
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
