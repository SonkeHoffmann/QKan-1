<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" minScale="1e+08" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes" version="3.28.13-Firenze" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal limitMode="0" endExpression="" mode="0" startField="" endField="" durationField="" accumulate="0" fixedDuration="0" startExpression="" durationUnit="min" enabled="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option name="dualview/previewExpressions" type="List">
        <Option value="&quot;bezext&quot;" type="QString"/>
      </Option>
      <Option value="0" name="embeddedWidgets/count" type="int"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend showLabelLegend="0" type="default-vector"/>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bezext" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bezqkan" configurationFlags="None">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option value="Schacht" name="Schacht" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Auslass" name="Auslass" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Speicher" name="Speicher" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Anschlussschacht" name="Anschlussschacht" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="{2839923C-8B7D-419E-B84B-CA2FE9B80EC7}" name="&lt;NULL>" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Symbol" name="Symbol" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kuerzel" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="subject" configurationFlags="None">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="modul" configurationFlags="None">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" name="allow_null" type="bool"/>
            <Option value="true" name="calendar_popup" type="bool"/>
            <Option value="dd.MMM.yyyy HH:mm:ss" name="display_format" type="QString"/>
            <Option value="yyyy-MM-dd HH:mm:ss" name="field_format" type="QString"/>
            <Option value="false" name="field_iso_format" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" field="pk" index="0"/>
    <alias name="Externe Bezeichnung" field="bezext" index="1"/>
    <alias name="Bezeichung" field="bezqkan" index="2"/>
    <alias name="Kürzel" field="kuerzel" index="3"/>
    <alias name="" field="subject" index="4"/>
    <alias name="" field="modul" index="5"/>
    <alias name="Kommentar" field="kommentar" index="6"/>
    <alias name="erstellt" field="createdat" index="7"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="bezext"/>
    <default applyOnUpdate="0" expression="" field="bezqkan"/>
    <default applyOnUpdate="0" expression="" field="kuerzel"/>
    <default applyOnUpdate="0" expression="'import_knotentypen'" field="subject"/>
    <default applyOnUpdate="0" expression="'m150'" field="modul"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression="" field="createdat"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" constraints="3" field="pk" unique_strength="1" notnull_strength="1"/>
    <constraint exp_strength="0" constraints="0" field="bezext" unique_strength="0" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" field="bezqkan" unique_strength="0" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" field="kuerzel" unique_strength="0" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" field="subject" unique_strength="0" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" field="modul" unique_strength="0" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" field="kommentar" unique_strength="0" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" field="createdat" unique_strength="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="bezext"/>
    <constraint exp="" desc="" field="bezqkan"/>
    <constraint exp="" desc="" field="kuerzel"/>
    <constraint exp="" desc="" field="subject"/>
    <constraint exp="" desc="" field="modul"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column width="-1" hidden="0" name="pk" type="field"/>
      <column width="-1" hidden="0" name="bezext" type="field"/>
      <column width="-1" hidden="0" name="bezqkan" type="field"/>
      <column width="-1" hidden="0" name="kuerzel" type="field"/>
      <column width="-1" hidden="1" name="subject" type="field"/>
      <column width="-1" hidden="1" name="modul" type="field"/>
      <column width="-1" hidden="0" name="kommentar" type="field"/>
      <column width="-1" hidden="0" name="createdat" type="field"/>
      <column width="-1" hidden="1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles>
      <fieldstyle fieldname="bezqkan">
        <style background_color="#fb9a99" background_color_alpha="255" name="Bezeichnung_unbekannt" rule="@value is NULL">
          <font style="" italic="0" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" underline="0" bold="0" strikethrough="0"/>
        </style>
      </fieldstyle>
    </fieldstyles>
  </conditionalstyles>
  <storedexpressions/>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS-Formulare können eine Python-Funktion haben,, die aufgerufen wird, wenn sich das Formular öffnet

Diese Funktion kann verwendet werden um dem Formular Extralogik hinzuzufügen.

Der Name der Funktion wird im Feld "Python Init-Function" angegeben
Ein Beispiel folgt:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <editable>
    <field name="bezext" editable="1"/>
    <field name="bezqkan" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="kuerzel" editable="1"/>
    <field name="modul" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="subject" editable="1"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="bezext"/>
    <field labelOnTop="0" name="bezqkan"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="kuerzel"/>
    <field labelOnTop="0" name="modul"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="subject"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="bezext" reuseLastValue="0"/>
    <field name="bezqkan" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="kuerzel" reuseLastValue="0"/>
    <field name="modul" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="subject" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"bezext"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
