import 'package:flutter/material.dart';
import 'article_view.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  const NewsTile({Key? key, required this.imgUrl, required this.desc, required this.title, required this.content, required this.posturl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: posturl,
            )
        ));
      },
      child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 211, 210),
            border: Border.all(
              color: const Color.fromARGB(255, 237, 211, 210),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 10),
          width: 275,
          height: 330,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imgUrl,
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 12,),
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                desc,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              )
            ],
          )),
    );
  }
}