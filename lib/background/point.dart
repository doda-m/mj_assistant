class Tsumo {
  final int child;
  final int parent;
  Tsumo(this.child, this.parent);
}

final List<List<Tsumo>> childTsumoPointTable = [
  [Tsumo(0,0), Tsumo(400, 700), Tsumo(700, 1300), Tsumo(1300, 2600),],
  [Tsumo(0,0), Tsumo(400, 800), Tsumo(800, 1600), Tsumo(1600, 3200),],
  [Tsumo(300, 500), Tsumo(500, 1000), Tsumo(1000, 2000), Tsumo(2000, 3900),],
  [Tsumo(400, 700), Tsumo(700, 1300), Tsumo(1300, 2600),],
  [Tsumo(400, 800), Tsumo(800, 1600), Tsumo(1600, 3200),],
  [Tsumo(500, 1000), Tsumo(1000, 2000), Tsumo(2000, 3900),],
  [Tsumo(600, 1200), Tsumo(1200, 2300),],
  [Tsumo(700, 1300), Tsumo(1300, 2600),],
  [Tsumo(800, 1500), Tsumo(1500, 2900),],
  [Tsumo(800, 1600), Tsumo(1600, 3200),],
  [Tsumo(900, 1800), Tsumo(1800, 3600),],
  [Tsumo(2000, 4000), Tsumo(3000, 4000), Tsumo(4000, 8000), Tsumo(6000, 12000), Tsumo(8000, 16000),],
];

const List<List<int>> parentTsumoPointTable = [
  [0, 700, 1300, 2600,],
  [0, 800, 1600, 3200,],
  [500, 1000, 2000, 3900,],
  [700, 1300, 2600,],
  [800, 1600, 3200,],
  [1000, 2000, 3900,],
  [1200, 2300,],
  [1300, 2600,],
  [1500, 2900,],
  [1600, 3200,],
  [1800, 3600,],
  [4000, 6000, 8000, 12000, 16000,],
];

const List<List<int>> childRonPointTable = [
  [0, 0, 0, 0,],
  [0, 1600, 3200, 6400,],
  [1000, 2000, 3900, 7700,],
  [1300, 2600, 5200,],
  [1600, 3200, 6400,],
  [2000, 3900, 7700,],
  [2300, 4500,],
  [2600, 5200,],
  [2900, 5800,],
  [3200, 6400,],
  [3600, 7100,],
  [8000, 12000, 16000, 24000, 32000],
];

const List<List<int>> parentRonPointTable = [
  [0, 0, 0, 0,],
  [0, 2400, 4800, 9600,],
  [1500, 2900, 5800, 11600,],
  [2000, 3900, 7700,],
  [2400, 4800, 9600,],
  [2900, 5800, 11600,],
  [3400, 6800,],
  [3900, 7700,],
  [4400, 8700,],
  [4800, 9600,],
  [5300, 10600,],
  [12000, 18000, 24000, 36000, 48000],
];

const List<String> fuList = [
  '20 符', '25 符', '30 符', '40 符', '50 符', '60 符',
  '70 符', '80 符', '90 符', '100 符', '110 符',
];
const List<String> han = ['1翻', '2翻', '3翻', '4翻',];
const List<String> pointList = ['満貫', '跳満', '倍満', '三倍満', '役満',];

const List<List<String>> childTsumoTable = [
  ['--', '400/700', '700/1300', '1300/2500'],
  ['--', '400/800', '800/1600', '1600/3200'],
  ['300/500', '500/1000', '1000/2000', '2000/3900'],
  ['400/700', '700/1300', '1300/2600', '--'],
  ['400/800', '800/1600', '1600/3200', '--'],
  ['500/1000', '1000/2000', '2000/3900', '--'],
  ['600/1200', '1200/2300', '--', '--'],
  ['700/1300', '1300/2600', '--', '--'],
  ['800/1500', '1500/2900', '--', '--'],
  ['800/1600', '1600/3200', '--', '--'],
  ['900/1800', '1800/3600', '--', '--'],
];

const List<List<String>> childRonTable = [
['--', '--', '--', '--'],
['--', '1600', '3200', '6400'],
['1000', '2000', '3900', '7700'],
['1300', '2600', '5200', '--'],
['1600', '3200', '6400', '--'],
['2000', '3900', '7700', '--'],
['2300', '4500', '--', '--'],
['2600', '5200', '--', '--'],
['2900', '5800', '--', '--'],
['3200', '6400', '--', '--'],
['3600', '7100', '--', '--'],
];


const List<List<String>> parentTsumoTable = [
  ['--', '700 ALL', '1300 ALL', '2500 ALL'],
  ['--', '800 ALL', '1600 ALL', '3200 ALL'],
  ['500 ALL', '1000 ALL', '2000 ALL', '3900 ALL'],
  ['700 ALL', '1300 ALL', '2600 ALL', '--'],
  ['800 ALL', '1600 ALL', '3200 ALL', '--'],
  ['1000 ALL', '2000 ALL', '3900 ALL', '--'],
  ['1200 ALL', '2300 ALL', '--', '--'],
  ['1300 ALL', '2600 ALL', '--', '--'],
  ['1500 ALL', '2900 ALL', '--', '--'],
  ['1600 ALL', '3200 ALL', '--', '--'],
  ['1800 ALL', '3600 ALL', '--', '--'],
];

const List<List<String>> parentRonTable = [
  ['--', '--', '--', '--'],
  ['--', '2400', '4800', '9600'],
  ['1500', '2900', '5800', '11600'],
  ['2000', '3900', '7700', '--'],
  ['2400', '4800', '9600', '--'],
  ['2900', '5800', '11600', '--'],
  ['3400', '6800', '--', '--'],
  ['3900', '7700', '--', '--'],
  ['4400', '8700', '--', '--'],
  ['4800', '9600', '--', '--'],
  ['5300', '10600', '--', '--'],
];
