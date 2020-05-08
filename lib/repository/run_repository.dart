import 'package:RuneoDriverFlutter/models/index.dart';
import 'package:RuneoDriverFlutter/provider/api_provider.dart';


abstract class RunRepository {
	Future<List<Run>> getRuns();
}

class RunRepositoryImpl implements RunRepository {
	ApiProvider _provider = ApiProvider();

	Future<List<Run>> getRuns() async {
		final List<Run> runs = [];
		final response = await _provider.get("runs");
    response.forEach((run) {
			runs.add(Run.fromJson(run));
		});
		return runs;
	}
}