<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis readOnly="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|AttributeTable|Notes" version="3.28.13-Firenze">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bezeichnung" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
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
    <field name="schachttyp" configurationFlags="None">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option value="Schacht" name="Schacht" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Speicher" name="Allg. Speicherelement" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Auslass" name="Auslass" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Pumpe" name="Pumpe, Pumpwerk" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Wehr" name="Wehr, Überfallbauwerk" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Strasseneinlauf" name="Strasseneinlauf" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Anschlusschacht" name="Hausanschlussschacht, allg. Anschlussschacht" type="QString"/>
              </Option>
              <Option type="Map">
                <Option value="Symbol" name="allg. Symbol" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="isybau" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="m150" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="m145" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
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
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Bezeichnung (M150)" index="1" field="bezeichnung"/>
    <alias name="Kurzbezeichnung (M150)" index="2" field="kuerzel"/>
    <alias name="QKan-Schachttyp" index="3" field="schachttyp"/>
    <alias name="ISYBAU" index="4" field="isybau"/>
    <alias name="M150" index="5" field="m150"/>
    <alias name="M145" index="6" field="m145"/>
    <alias name="Kommentar" index="7" field="kommentar"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="bezeichnung"/>
    <default applyOnUpdate="0" expression="" field="kuerzel"/>
    <default applyOnUpdate="0" expression="" field="schachttyp"/>
    <default applyOnUpdate="0" expression="" field="isybau"/>
    <default applyOnUpdate="0" expression="" field="m150"/>
    <default applyOnUpdate="0" expression="" field="m145"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" constraints="3" unique_strength="1" exp_strength="0" field="pk"/>
    <constraint notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0" field="bezeichnung"/>
    <constraint notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0" field="kuerzel"/>
    <constraint notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0" field="schachttyp"/>
    <constraint notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0" field="isybau"/>
    <constraint notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0" field="m150"/>
    <constraint notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0" field="m145"/>
    <constraint notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0" field="kommentar"/>
  </constraints>
  <constraintExpressions>
    <constraint field="pk" desc="" exp=""/>
    <constraint field="bezeichnung" desc="" exp=""/>
    <constraint field="kuerzel" desc="" exp=""/>
    <constraint field="schachttyp" desc="" exp=""/>
    <constraint field="isybau" desc="" exp=""/>
    <constraint field="m150" desc="" exp=""/>
    <constraint field="m145" desc="" exp=""/>
    <constraint field="kommentar" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column name="pk" width="-1" hidden="0" type="field"/>
      <column name="bezeichnung" width="137" hidden="0" type="field"/>
      <column name="kuerzel" width="158" hidden="0" type="field"/>
      <column name="schachttyp" width="141" hidden="0" type="field"/>
      <column name="isybau" width="-1" hidden="0" type="field"/>
      <column name="m150" width="-1" hidden="0" type="field"/>
      <column name="m145" width="-1" hidden="0" type="field"/>
      <column name="kommentar" width="-1" hidden="0" type="field"/>
      <column width="-1" hidden="1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:/Users/hoettges/AppData/Roaming/QGIS/QGIS3/profiles/default/python/plugins/qkan/forms/qkan_m150_knotenarten.ui</editform>
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
    <field name="bezeichnung" editable="1"/>
    <field name="isybau" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="kuerzel" editable="1"/>
    <field name="m145" editable="1"/>
    <field name="m150" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="schachttyp" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="bezeichnung" labelOnTop="0"/>
    <field name="isybau" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="kuerzel" labelOnTop="0"/>
    <field name="m145" labelOnTop="0"/>
    <field name="m150" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="schachttyp" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="bezeichnung" reuseLastValue="0"/>
    <field name="isybau" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="kuerzel" reuseLastValue="0"/>
    <field name="m145" reuseLastValue="0"/>
    <field name="m150" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="schachttyp" reuseLastValue="1"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"bezeichnung"</previewExpression>
  <layerGeometryType>4</layerGeometryType>
</qgis>
