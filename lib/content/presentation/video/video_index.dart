import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:toktik_clean/content/data/datasource/content_datasource.dart';
import 'package:toktik_clean/content/data/repositories/content_repository_impl.dart';
import 'package:toktik_clean/content/domain/entities/content_entity.dart';
import 'package:toktik_clean/content/domain/usecases/video_usecases.dart';
import 'package:toktik_clean/content/presentation/video/providers/discover_provider.dart';
import 'package:toktik_clean/content/presentation/video/screens/discover/discover_screen.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:toktik_clean/user/domain/entities/user_entity.dart';
import 'package:toktik_clean/user/presentation/providers/user.provider.dart';


class VideoIndex extends StatelessWidget {
  const VideoIndex({super.key});

  @override
  Widget build(BuildContext context) {
    
    final discoverUserProvider = context.watch<DiscoverUserProvider>();
    final discoverContentProvider = context.watch<DiscoverProvider>();
    return Scaffold(
        body: Stack(
          children: [
            const Positioned.fill(
              child: DiscoverScreen()
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 16.0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async{},
                      icon: const Icon(Icons.play_arrow),
                      color: Colors.white,
                      iconSize: 32,
                    ),
                    IconButton(
                      onPressed: () async{
                        FilePickerResult? result = await FilePicker.platform.pickFiles();
                        if (result != null) {
                          // Obtiene la ruta del archivo seleccionado
                          String? filePath = result.files.single.path;
                          String extension = path.extension(filePath!);
                          String fileName = path.basenameWithoutExtension(filePath);
                          String type = "video";
                          final idUser = discoverUserProvider.user!.id;
                          await discoverContentProvider.post(filePath, idUser, type, true);
                        }
                      }, 
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      iconSize: 100,
                    ),
                    IconButton(
                      onPressed: () async{
                        context.pushReplacement("/audios");
                      }, 
                      icon: const Icon(Icons.disc_full_outlined),
                      color: Colors.white,
                      iconSize: 32,
                    ),
                  ],
                ),
              ),
            )
          ]
        ),
      );
  }
}