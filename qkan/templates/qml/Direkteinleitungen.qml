<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes" simplifyAlgorithm="0" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="0" symbologyReferenceScale="-1" simplifyDrawingTol="1" minScale="0" simplifyLocal="1" labelsEnabled="0" version="3.28.15-Firenze" readOnly="0">
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
  <renderer-v2 symbollevels="0" referencescale="-1" forceraster="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="marker" frame_rate="10" alpha="1" name="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="angle"/>
            <Option value="square" type="QString" name="cap_style"/>
            <Option value="188,125,91,255" type="QString" name="color"/>
            <Option value="1" type="QString" name="horizontal_anchor_point"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="circle" type="QString" name="name"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0" type="QString" name="outline_width"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="diameter" type="QString" name="scale_method"/>
            <Option value="2" type="QString" name="size"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
            <Option value="MM" type="QString" name="size_unit"/>
            <Option value="1" type="QString" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
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
      <Option value="0" type="int" name="embeddedWidgets/count"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <legend type="default-vector" showLabelLegend="0"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="pk">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="elnam">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="haltnam">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="Description"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="haltnam" type="QString" name="Key"/>
            <Option value="haltungen20161016203756230" type="QString" name="Layer"/>
            <Option value="Haltungen" type="QString" name="LayerName"/>
            <Option value="spatialite" type="QString" name="LayerProviderName"/>
            <Option value="dbname='C:/Users/hoettges/Documents/juelich' host=qkan-public.gbd-websuite.de port=5432 user='isce' key='pk' srid=25832 type=LineString checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;haltungen&quot; (geom) sql=haltungstyp IS NULL or haltungstyp = 'Haltung'" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="UseCompleter"/>
            <Option value="haltnam" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schnam">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="Description"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="schnam" type="QString" name="Key"/>
            <Option value="Geometrien_53c691ed_4408_4aea_a1e3_95482f944a0b" type="QString" name="Layer"/>
            <Option value="Geometrien" type="QString" name="LayerName"/>
            <Option value="spatialite" type="QString" name="LayerProviderName"/>
            <Option value="dbname='C:/Users/hoettges/Documents/juelich' host=qkan-public.gbd-websuite.de port=5432 user='isce' key='pk' srid=25832 type=MultiPolygon checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;schaechte&quot; (geom)" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="UseCompleter"/>
            <Option value="schnam" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="teilgebiet">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="Description"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="tgnam" type="QString" name="Key"/>
            <Option value="Teilgebiete_786fa926_704f_4cb1_bc67_eb8571f2f6c0" type="QString" name="Layer"/>
            <Option value="Teilgebiete" type="QString" name="LayerName"/>
            <Option value="spatialite" type="QString" name="LayerProviderName"/>
            <Option value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=MultiPolygon checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;teilgebiete&quot; (geom)" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="UseCompleter"/>
            <Option value="tgnam" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="zufluss">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ew">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="einzugsgebiet">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kommentar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="createdat">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="allow_null"/>
            <Option value="true" type="bool" name="calendar_popup"/>
            <Option value="dd.MM.yyyy HH:mm:ss" type="QString" name="display_format"/>
            <Option value="yyyy-MM-dd HH:mm:ss" type="QString" name="field_format"/>
            <Option value="false" type="bool" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" index="0" name=""/>
    <alias field="elnam" index="1" name="Name"/>
    <alias field="haltnam" index="2" name="Haltung"/>
    <alias field="schnam" index="3" name="Schacht"/>
    <alias field="teilgebiet" index="4" name="Teilgebiet"/>
    <alias field="zufluss" index="5" name="Zufluss (m³/s)"/>
    <alias field="ew" index="6" name="EW"/>
    <alias field="einzugsgebiet" index="7" name="Einzugsgebiet"/>
    <alias field="kommentar" index="8" name="Kommentar"/>
    <alias field="createdat" index="9" name="bearbeitet"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="elnam"/>
    <default expression="" applyOnUpdate="0" field="haltnam"/>
    <default expression="" applyOnUpdate="0" field="schnam"/>
    <default expression="" applyOnUpdate="0" field="teilgebiet"/>
    <default expression="" applyOnUpdate="0" field="zufluss"/>
    <default expression="" applyOnUpdate="0" field="ew"/>
    <default expression="" applyOnUpdate="0" field="einzugsgebiet"/>
    <default expression="" applyOnUpdate="0" field="kommentar"/>
    <default expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" applyOnUpdate="0" field="createdat"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="2" exp_strength="0" field="pk" constraints="3" unique_strength="2"/>
    <constraint notnull_strength="0" exp_strength="0" field="elnam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="haltnam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="schnam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="teilgebiet" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="zufluss" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="ew" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="einzugsgebiet" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kommentar" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="createdat" constraints="0" unique_strength="0"/>
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
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" type="field" width="-1" name="pk"/>
      <column hidden="0" type="field" width="-1" name="elnam"/>
      <column hidden="0" type="field" width="-1" name="haltnam"/>
      <column hidden="0" type="field" width="-1" name="teilgebiet"/>
      <column hidden="0" type="field" width="-1" name="zufluss"/>
      <column hidden="0" type="field" width="-1" name="ew"/>
      <column hidden="0" type="field" width="-1" name="einzugsgebiet"/>
      <column hidden="0" type="field" width="-1" name="kommentar"/>
      <column hidden="0" type="field" width="-1" name="createdat"/>
      <column hidden="0" type="field" width="-1" name="schnam"/>
      <column hidden="1" type="actions" width="-1"/>
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
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="einzugsgebiet"/>
    <field reuseLastValue="0" name="elnam"/>
    <field reuseLastValue="0" name="ew"/>
    <field reuseLastValue="0" name="haltnam"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="schnam"/>
    <field reuseLastValue="0" name="teilgebiet"/>
    <field reuseLastValue="0" name="zufluss"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"elnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
