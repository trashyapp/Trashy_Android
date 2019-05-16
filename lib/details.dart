import 'package:flutter/material.dart';

var items = {
  'Mülltrennung': 'Mülltrennung\nIm Grunde ist Mülltrennung ganz simpel und schnell erklärt! Man unterscheidet fünf Kategorien:\n•    Leichtverpackungen (LVP) aus Kunststoff, Alu, Weißblech oder Verbundmaterialien wie Getränkekartons\n•    Behälterglas (also keine Trinkgläser, kein Flachglas)\n•    Papier/Pappe/Karton\n•    Restmüll\nBioabfall\nGetrennt werden muss nicht nur der Abfall aus Konsum und Produktion (Primärabfall), sondern auch der Sekundärabfall, der aus der Entsorgung entsteht (Müllverbrennungsaschen und -schlacken, Schreddergut, Klärschlamm, Reste der Tierkörperverwertung).\nMülltrennung umfasst zwei Methoden, das Sortieren durch den Verursacher selbst und das nachträgliche Sortieren in Müllsortieranlagen (Splitting)',
  'Verpackungsmüll': 'In die Gelbe Tonnen / den Gelben Sack gehören ausschließlich Verkaufsverpackungen aus Kunststoff, Metall oder Verbundmaterialien, andere Gegenstände auch aus den gleichen Materialien, z. B. Kunststoffzahnbürsten, Videokassetten, CDs, DVDs oder Einwegrasierer gehören nicht in den gelben Sack.\nVerpackungen, die über den Gelben Sack bzw. die Gelbe Tonne entsorgt werden (Beispiele):\n•    Verpackungen aus Kunststoff\n•    Spülmittelflaschen, Joghurt becher, Plastiktuben, Verpackungen für Körperpflegemittel\n•    Milch-, Saft- und Weinkartons (z. B. Tetra Pak)\n•    Plastiktüten, Eisverpackungen, Zahncremetuben etc.\n•    Verpackungen aus Verbundstoffen\n•    Vakuumverpackungen für Kaffee, Styroporverpackungen etc.\n•    Verpackungen aus Metall, Alufolie, Getränke- und Konservendosen, Kronkorken, Metallverschlüsse, Deckel etc. (in Österreich werden diese metallischen Stoffe getrennt gesammelt)',
  'Papiermüll': 'Altpapier wird in Altpapiersammelcontainern oder in Altpapiertonnen gesammelt, von der Gemeinde beziehungsweise von einem von der Gemeinde beauftragten Betrieb oder von privaten Die Sortierung von Altpapier ist eine wichtige Voraussetzung, um der Papierindustrie die Altpapier-Qualitäten zur Verfügung zu stellen, die benötigt werden. Dabei geht es einerseits darum, die papierfremden Stoffe aus dem Sammelgut zu entfernen, und andererseits darum, definierte Altpapiersorten zusammenzustellen, die von der Papierindustrie nachgefragt werden. Die Sortierung erfolgt manuell oder teilautomatisiert und stellt letztlich die Qualitätssicherung vor Abgabe des gebrauchten Papiers an die Papierfabrik dar.',
  'Biomüll': 'Die Biotonne bezeichnet einen Behälter aus Kunststoff mit Deckel, in dem die im Haushalt anfallenden biologisch verwertbaren Abfallstoffe entsorgt werden können. Im Gegensatz zur übrigen Abfallentsorgung ist die dort Grünabfuhr genannte Entsorgung je nach Gemeinde extrem unterschiedlich oder sogar gar nicht organisiert. Für die Bereitstellung einer Biotonne wird zumeist von den Entsorgungsunternehmen eine gesonderte Gebühr erhoben.',
  'Restmüll': 'Als Restmüll wird die Summe aller Abfälle bezeichnet, die wegen Verunreinigung oder Vermischung keiner der getrennt zu sammelnden Abfallfraktionen (Altpapier (Papier, Pappe, Kartonagen), Altmetall, Altglas, Bioabfall, Leichtverpackungen (LVP, Grüner Punkt), Altholz, Elektroschrott, Gefahrstoffe etc.) zugeordnet werden kann. Daher gibt es nur sehr wenige Dinge, die originär zum Restmüll gehören (z. B. Zigarettenkippen, Babywindeln, Hygieneartikel, verschmutzte Tücher, Lappen und Filter, Staub, Asche).',
  'Pfandautomat': 'Das Flaschenpfand, ist ein Pfandsystem und bezeichnet einen Geldbetrag, den der Kunde bei einem Getränkeanbieter für eine gekaufte Flasche hinterlässt und mit Rückgabe der Flasche zurückerhält. Das System soll den Rücklauf der Flaschen und Pfandkisten zur Wiederverwendung stimulieren. Entscheidend sind ökologische Aspekte wie Ressourcenschonung und Energieeffizienz. Generell ist zwischen Einwegpfand- und Mehrwegpfand-Systemen zu unterscheiden. Bei Mehrwegpfand-Systemen wird die Flasche wiederbefüllt, bei Einweg wird die Flasche meist stofflich verwertet.',
  'Glascontainer': 'Glas ist ein wichtiges Material zum Verpacken von Lebensmitteln. Glasrecycling hat in Deutschland Tradition. Bundesweit werden gebrauchte Glasverpackungen in Containern für Grün-, Weiß- und Braunglas gesammelt und der Verwertung zugeführt. Die Recyclingmenge von Glas ist seit Beginn der 70er-Jahre stetig gestiegen. Wurden 1972 rund 3.500 Tonnen Glas verwertet, so waren es Ende der 80er-Jahre bereits 1,3 Millionen Tonnen. Heute sind es über 2 Millionen Tonnen Glas. Die gesammelten Behältergläser gelangen in einen geschlossenen Wertstoffkreislauf und können beliebig oft recycelt werden. Wichtig dabei ist das richtige Trennen nach Farben: Neben Containern für weißes und braunes Glas, stehen die Grünglascontainer für grünes und sonstiges Buntglas zur Verfügung. Seit einigen Jahren geht der Glasverbrauch zu Gunsten von Kunststoffflaschen aus PET zurück. Das leichtere Material wird vor allem immer häufiger für Getränkeflaschen verwendet.',
  'PET': 'Polyethylenterephtalat (PET) gehört neben dem ebenfalls weit verbreiteten Polycarbonat (PC) zur Gruppe der Polyester. Zu den Hauptanwendungen für PET zählt die PET-Flasche, die aufgrund der günstigeren Rohstoffkosten  und vor allem auf Grund ihres geringeren Gewichtes zunehmend die Glasflasche vom Markt verdrängt. Recyceltes PET hat im „bottle to bottle“ - Recycling die Lebensmittelzulassung. Eine weitere häufig vertretene Anwendung von PET sind Mikrofasern für Textilien und Vliesstoffe. Häufig werden diese Mikrofasern aus recycelten PET-Einwegflaschen gewonnen.',
  'Sekundärrohstoffe': 'Rohstoffe, die durch Recycling wieder gewonnen werden und als Ausgangsstoffe für neue Produkte dienen. So werden etwa gebrauchte Verpackungen aus Glas, Papier, Kunststoff, Aluminium, Weißblech und Verbundstoffen durch verschiedene Verwertungsverfahren wieder in den Produktionsprozess zurückgeführt. Die Nutzung von Sekundärrohstoffen schont natürliche Ressourcen und leistet einen Beitrag zu einer nachhaltigen Entwicklung.'
};

var images = {
  'Biomüll': 'Biomüll.png',
  'Verpackungsmüll': 'Verpackungsmüll.png',
  'Glascontainer': 'Glas_Ergebnis.png',
  'Pfandautomat': 'Pfand_Ergebnis.png',
  'Papiermüll': 'Papiermüll.png',
  'Restmüll': 'Restmüll.png'
};

class DetailPage extends StatefulWidget {

  final String tonne;
  DetailPage({this.tonne});

  @override
  _DetailPageState createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    print(widget.tonne);
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Ergebnis"),
        backgroundColor: Color(0xff1da5e9),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Text(widget.tonne, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                SizedBox(height: 10),
                images.containsKey(widget.tonne) ? Image.asset('assets/' + images[widget.tonne], height: 200) : Container(),
                images.containsKey(widget.tonne) ? SizedBox(height: 10) : Container(),
                SizedBox(
                    width: 330,
                    child: Text(items[widget.tonne], style: TextStyle(fontSize: 18))
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
