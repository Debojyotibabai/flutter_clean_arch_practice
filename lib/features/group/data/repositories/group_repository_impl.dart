import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/data_sources/group_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/models/get_all_groups_model.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/repositories/group_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:fpdart/fpdart.dart';

class GroupRepositoryImpl implements GroupRepository {
  final GroupDataSource groupDataSourceImpl;

  GroupRepositoryImpl({required this.groupDataSourceImpl});

  @override
  Future<Either<Failure, GetAllGroupsModel>> getAllGroups({
    required GetAllGroupsParams params,
  }) async {
    try {
      final response = await groupDataSourceImpl.getAllGroups(params);

      return right(response);
    } catch (err) {
      return left(Failure(err.toString()));
    }
  }
}
