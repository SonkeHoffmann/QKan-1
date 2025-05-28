<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes" hasScaleBasedVisibilityFlag="0" minScale="0" version="3.28.15-Firenze" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endField="" accumulate="0" startField="" endExpression="" fixedDuration="0" mode="0" limitMode="0" durationField="pk" enabled="0" durationUnit="min" startExpression="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
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
      <Option type="List" name="dualview/previewExpressions">
        <Option value="&quot;apnam&quot;" type="QString"/>
      </Option>
      <Option value="0" type="int" name="embeddedWidgets/count"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
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
    <field configurationFlags="None" name="apnam">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="anfangsabflussbeiwert">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="endabflussbeiwert">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="benetzungsverlust">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="muldenverlust">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="benetzung_startwert">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="mulden_startwert">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rauheit_kst">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="pctZero">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bodenklasse">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="Description"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="bknam" type="QString" name="Key"/>
            <Option value="bodenklassen20170516122309914" type="QString" name="Layer"/>
            <Option value="Bodenart" type="QString" name="LayerName"/>
            <Option value="spatialite" type="QString" name="LayerProviderName"/>
            <Option value="dbname='bruehl.sqlite' table=&quot;bodenklassen&quot;" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="bknam" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="flaechentyp">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="Description"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="bezeichnung" type="QString" name="Key"/>
            <Option value="flaechentypen_ca71f66a_50bb_41cb_86df_8046fae64926" type="QString" name="Layer"/>
            <Option value="Flächentypen" type="QString" name="LayerName"/>
            <Option value="spatialite" type="QString" name="LayerProviderName"/>
            <Option value="dbname='bruehl.sqlite' table=&quot;flaechentypen&quot;" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="bezeichnung" type="QString" name="Value"/>
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
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" index="0" name=""/>
    <alias field="apnam" index="1" name="Name"/>
    <alias field="anfangsabflussbeiwert" index="2" name="Anfangsabflussbeiwert"/>
    <alias field="endabflussbeiwert" index="3" name="Endabflussbeiwert"/>
    <alias field="benetzungsverlust" index="4" name="Benetzungsverlust"/>
    <alias field="muldenverlust" index="5" name="Muldenverlust"/>
    <alias field="benetzung_startwert" index="6" name="Benetzung Startwert"/>
    <alias field="mulden_startwert" index="7" name="Mulden Startwert"/>
    <alias field="rauheit_kst" index="8" name="Rauheitsbeiwert"/>
    <alias field="pctZero" index="9" name=""/>
    <alias field="bodenklasse" index="10" name="Bodenart"/>
    <alias field="flaechentyp" index="11" name="Flächentyp"/>
    <alias field="kommentar" index="12" name="Kommentar"/>
    <alias field="createdat" index="13" name="bearbeitet"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="apnam"/>
    <default expression="" applyOnUpdate="0" field="anfangsabflussbeiwert"/>
    <default expression="" applyOnUpdate="0" field="endabflussbeiwert"/>
    <default expression="" applyOnUpdate="0" field="benetzungsverlust"/>
    <default expression="" applyOnUpdate="0" field="muldenverlust"/>
    <default expression="" applyOnUpdate="0" field="benetzung_startwert"/>
    <default expression="" applyOnUpdate="0" field="mulden_startwert"/>
    <default expression="" applyOnUpdate="0" field="rauheit_kst"/>
    <default expression="" applyOnUpdate="0" field="pctZero"/>
    <default expression="" applyOnUpdate="0" field="bodenklasse"/>
    <default expression="" applyOnUpdate="0" field="flaechentyp"/>
    <default expression="" applyOnUpdate="0" field="kommentar"/>
    <default expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" applyOnUpdate="0" field="createdat"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="2" exp_strength="0" field="pk" constraints="3" unique_strength="2"/>
    <constraint notnull_strength="0" exp_strength="0" field="apnam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="anfangsabflussbeiwert" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="endabflussbeiwert" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="benetzungsverlust" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="muldenverlust" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="benetzung_startwert" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="mulden_startwert" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="rauheit_kst" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="pctZero" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="bodenklasse" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="flaechentyp" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kommentar" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="createdat" constraints="0" unique_strength="0"/>
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
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="1" type="field" width="-1" name="pk"/>
      <column hidden="0" type="field" width="127" name="apnam"/>
      <column hidden="0" type="field" width="-1" name="anfangsabflussbeiwert"/>
      <column hidden="0" type="field" width="-1" name="endabflussbeiwert"/>
      <column hidden="0" type="field" width="-1" name="benetzungsverlust"/>
      <column hidden="0" type="field" width="-1" name="muldenverlust"/>
      <column hidden="0" type="field" width="-1" name="benetzung_startwert"/>
      <column hidden="0" type="field" width="-1" name="mulden_startwert"/>
      <column hidden="1" type="field" width="-1" name="rauheit_kst"/>
      <column hidden="0" type="field" width="-1" name="bodenklasse"/>
      <column hidden="0" type="field" width="-1" name="flaechentyp"/>
      <column hidden="0" type="field" width="-1" name="kommentar"/>
      <column hidden="0" type="field" width="-1" name="createdat"/>
      <column hidden="0" type="field" width="-1" name="pctZero"/>
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
    <field name="anfangsabflussbeiwert" labelOnTop="0"/>
    <field name="apnam" labelOnTop="0"/>
    <field name="benetzung_startwert" labelOnTop="0"/>
    <field name="benetzungsverlust" labelOnTop="0"/>
    <field name="bodenklasse" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="endabflussbeiwert" labelOnTop="0"/>
    <field name="flaechentyp" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="mulden_startwert" labelOnTop="0"/>
    <field name="muldenverlust" labelOnTop="0"/>
    <field name="pctZero" labelOnTop="0"/>
    <field name="pctzero" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="rauheit_kst" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="anfangsabflussbeiwert"/>
    <field reuseLastValue="0" name="apnam"/>
    <field reuseLastValue="0" name="benetzung_startwert"/>
    <field reuseLastValue="0" name="benetzungsverlust"/>
    <field reuseLastValue="0" name="bodenklasse"/>
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="endabflussbeiwert"/>
    <field reuseLastValue="0" name="flaechentyp"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="mulden_startwert"/>
    <field reuseLastValue="0" name="muldenverlust"/>
    <field reuseLastValue="0" name="pctZero"/>
    <field reuseLastValue="0" name="pctzero"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="rauheit_kst"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"apnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
