import 'package:hive_ce/hive_ce.dart';
import 'package:pds_2/hive/models/user_type.dart';

@GenerateAdapters([AdapterSpec<UserType>()])
part 'hive_adapters.g.dart';
