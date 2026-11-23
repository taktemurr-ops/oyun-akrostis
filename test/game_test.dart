import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_akrostis/oyun_akrostis.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(akrostisConfig.title.length, 33);
    expect(akrostisConfig.tagline.length, 33);
    for (final s in akrostisConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(akrostisConfig.gameId, akrostisId);
    expect(akrostisRules.gameId, akrostisId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(akrostisRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: akrostisId, optionalMechanics: akrostisRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      akrostisRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(akrostisRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
