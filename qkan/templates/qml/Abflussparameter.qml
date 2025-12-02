<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" minScale="0" version="3.28.13-Firenze" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal durationField="pk" accumulate="0" enabled="0" durationUnit="min" startExpression="" fixedDuration="0" mode="0" limitMode="0" endExpression="" startField="" endField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option type="QString" name="QFieldSync/action" value="no_action"/>
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
        <Option type="QString" value="&quot;apnam&quot;"/>
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
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="apnam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="anfangsabflussbeiwert" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="endabflussbeiwert" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="benetzungsverlust" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="muldenverlust" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="benetzung_startwert" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="mulden_startwert" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rauheit_kst" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pctZero" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bodenklasse" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="bknam"/>
            <Option type="QString" name="Layer" value="bodenklassen20170516122309914"/>
            <Option type="QString" name="LayerName" value="Bodenart"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='demo.sqlite' table=&quot;bodenklassen&quot;"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="bknam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flaechentyp" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="bezeichnung"/>
            <Option type="QString" name="Layer" value="flaechentypen_ca71f66a_50bb_41cb_86df_8046fae64926"/>
            <Option type="QString" name="LayerName" value="Flächentypen"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='demo.sqlite' table=&quot;flaechentypen&quot;"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="bezeichnung"/>
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
    <alias name="Name" index="1" field="apnam"/>
    <alias name="Anfangsabflussbeiwert" index="2" field="anfangsabflussbeiwert"/>
    <alias name="Endabflussbeiwert" index="3" field="endabflussbeiwert"/>
    <alias name="Benetzungsverlust" index="4" field="benetzungsverlust"/>
    <alias name="Muldenverlust" index="5" field="muldenverlust"/>
    <alias name="Benetzung Startwert" index="6" field="benetzung_startwert"/>
    <alias name="Mulden Startwert" index="7" field="mulden_startwert"/>
    <alias name="Rauheitsbeiwert" index="8" field="rauheit_kst"/>
    <alias name="" index="9" field="pctZero"/>
    <alias name="Bodenart" index="10" field="bodenklasse"/>
    <alias name="Flächentyp" index="11" field="flaechentyp"/>
    <alias name="Kommentar" index="12" field="kommentar"/>
    <alias name="bearbeitet" index="13" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="apnam"/>
    <default applyOnUpdate="0" expression="" field="anfangsabflussbeiwert"/>
    <default applyOnUpdate="0" expression="" field="endabflussbeiwert"/>
    <default applyOnUpdate="0" expression="" field="benetzungsverlust"/>
    <default applyOnUpdate="0" expression="" field="muldenverlust"/>
    <default applyOnUpdate="0" expression="" field="benetzung_startwert"/>
    <default applyOnUpdate="0" expression="" field="mulden_startwert"/>
    <default applyOnUpdate="0" expression="" field="rauheit_kst"/>
    <default applyOnUpdate="0" expression="" field="pctZero"/>
    <default applyOnUpdate="0" expression="" field="bodenklasse"/>
    <default applyOnUpdate="0" expression="" field="flaechentyp"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="2" constraints="3" notnull_strength="2" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="apnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="anfangsabflussbeiwert"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="endabflussbeiwert"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="benetzungsverlust"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="muldenverlust"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="benetzung_startwert"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="mulden_startwert"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rauheit_kst"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="pctZero"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bodenklasse"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="flaechentyp"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kommentar"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="apnam"/>
    <constraint exp="" desc="" field="anfangsabflussbeiwert"/>
    <constraint exp="" desc="" field="endabflussbeiwert"/>
    <constraint exp="" desc="" field="benetzungsverlust"/>
    <constraint exp="" desc="" field="muldenverlust"/>
    <constraint exp="" desc="" field="benetzung_startwert"/>
    <constraint exp="" desc="" field="mulden_startwert"/>
    <constraint exp="" desc="" field="rauheit_kst"/>
    <constraint exp="" desc="" field="pctZero"/>
    <constraint exp="" desc="" field="bodenklasse"/>
    <constraint exp="" desc="" field="flaechentyp"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column width="-1" type="field" name="pk" hidden="1"/>
      <column width="127" type="field" name="apnam" hidden="0"/>
      <column width="-1" type="field" name="anfangsabflussbeiwert" hidden="0"/>
      <column width="-1" type="field" name="endabflussbeiwert" hidden="0"/>
      <column width="-1" type="field" name="benetzungsverlust" hidden="0"/>
      <column width="-1" type="field" name="muldenverlust" hidden="0"/>
      <column width="-1" type="field" name="benetzung_startwert" hidden="0"/>
      <column width="-1" type="field" name="mulden_startwert" hidden="0"/>
      <column width="-1" type="field" name="rauheit_kst" hidden="1"/>
      <column width="-1" type="field" name="bodenklasse" hidden="0"/>
      <column width="-1" type="field" name="flaechentyp" hidden="0"/>
      <column width="-1" type="field" name="kommentar" hidden="0"/>
      <column width="-1" type="field" name="createdat" hidden="0"/>
      <column width="-1" type="field" name="pctZero" hidden="0"/>
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
    <field editable="1" name="anfangsabflussbeiwert"/>
    <field editable="1" name="apnam"/>
    <field editable="1" name="benetzung_startwert"/>
    <field editable="1" name="benetzungsverlust"/>
    <field editable="1" name="bodenklasse"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="endabflussbeiwert"/>
    <field editable="1" name="flaechentyp"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="mulden_startwert"/>
    <field editable="1" name="muldenverlust"/>
    <field editable="1" name="pctZero"/>
    <field editable="1" name="pctzero"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="rauheit_kst"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="anfangsabflussbeiwert"/>
    <field labelOnTop="0" name="apnam"/>
    <field labelOnTop="0" name="benetzung_startwert"/>
    <field labelOnTop="0" name="benetzungsverlust"/>
    <field labelOnTop="0" name="bodenklasse"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="endabflussbeiwert"/>
    <field labelOnTop="0" name="flaechentyp"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="mulden_startwert"/>
    <field labelOnTop="0" name="muldenverlust"/>
    <field labelOnTop="0" name="pctZero"/>
    <field labelOnTop="0" name="pctzero"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="rauheit_kst"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="anfangsabflussbeiwert" reuseLastValue="0"/>
    <field name="apnam" reuseLastValue="0"/>
    <field name="benetzung_startwert" reuseLastValue="0"/>
    <field name="benetzungsverlust" reuseLastValue="0"/>
    <field name="bodenklasse" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="endabflussbeiwert" reuseLastValue="0"/>
    <field name="flaechentyp" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="mulden_startwert" reuseLastValue="0"/>
    <field name="muldenverlust" reuseLastValue="0"/>
    <field name="pctZero" reuseLastValue="0"/>
    <field name="pctzero" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="rauheit_kst" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"apnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
