<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" minScale="0" simplifyDrawingHints="0" symbologyReferenceScale="-1" simplifyDrawingTol="1" simplifyLocal="1" labelsEnabled="0" simplifyAlgorithm="0" version="3.28.13-Firenze" simplifyMaxScale="1" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes">
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
      <symbol type="marker" clip_to_extent="1" name="0" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleMarker" locked="0">
          <Option type="Map">
            <Option type="QString" name="angle" value="0"/>
            <Option type="QString" name="cap_style" value="square"/>
            <Option type="QString" name="color" value="188,125,91,255"/>
            <Option type="QString" name="horizontal_anchor_point" value="1"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="name" value="circle"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="0,0,0,255"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="scale_method" value="diameter"/>
            <Option type="QString" name="size" value="2"/>
            <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="size_unit" value="MM"/>
            <Option type="QString" name="vertical_anchor_point" value="1"/>
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
    <checkConfiguration/>
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
    <field name="elnam" configurationFlags="None">
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
            <Option type="QString" name="LayerName" value="Haltungen"/>
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
            <Option type="QString" name="LayerSource" value="dbname='demo.sqlite' table=&quot;schaechte&quot; (geom)"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="schnam"/>
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
            <Option type="QString" name="Description" value=""/>
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
    <field name="zufluss" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ew" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="einzugsgebiet" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
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
    <constraint exp_strength="0" unique_strength="2" constraints="3" notnull_strength="2" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="elnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="haltnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="schnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="teilgebiet"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="zufluss"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="ew"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="einzugsgebiet"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kommentar"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createdat"/>
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
      <column width="-1" type="field" name="pk" hidden="0"/>
      <column width="-1" type="field" name="elnam" hidden="0"/>
      <column width="-1" type="field" name="haltnam" hidden="0"/>
      <column width="-1" type="field" name="teilgebiet" hidden="0"/>
      <column width="-1" type="field" name="zufluss" hidden="0"/>
      <column width="-1" type="field" name="ew" hidden="0"/>
      <column width="-1" type="field" name="einzugsgebiet" hidden="0"/>
      <column width="-1" type="field" name="kommentar" hidden="0"/>
      <column width="-1" type="field" name="createdat" hidden="0"/>
      <column width="-1" type="field" name="schnam" hidden="0"/>
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
    <field editable="1" name="createdat"/>
    <field editable="1" name="einzugsgebiet"/>
    <field editable="1" name="elnam"/>
    <field editable="1" name="ew"/>
    <field editable="1" name="haltnam"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="schnam"/>
    <field editable="1" name="teilgebiet"/>
    <field editable="1" name="zufluss"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="einzugsgebiet"/>
    <field labelOnTop="0" name="elnam"/>
    <field labelOnTop="0" name="ew"/>
    <field labelOnTop="0" name="haltnam"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="schnam"/>
    <field labelOnTop="0" name="teilgebiet"/>
    <field labelOnTop="0" name="zufluss"/>
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
