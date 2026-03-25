// 각 영화의 제목과 해당 영화에 달린 댓글을 조회해서 출력해주세요.
db.movies.find().limit(1) // _id
db.comments.find().limit(1) // movie_id

db.movies.aggregate([
  {
    $lookup: {
      from: "comments",
      localField: "_id",
      foreignField: "movie_id",
      as: "movie_comments"
    }
  },
  {
    $project: {
      _id: 0,
      title: 1,
      movie_comments: 1
    }
  },
  {
    $match: {movie_comments: {$ne: []}}
  }
])

// 평점이 가장 높은 영화의 제목과 평점을 조회.출력
db.movies.aggregate([
  {$sort: {"imdb.rating": -1}},
  {$match: {"imdb.rating": {$ne: ""}}},
  {$limit: 1},
  {$project: {_id: 0, title: 1, "imdb.rating": 1}}
])

// 각 장르별, 평균평점이 가장 높은 장르와 해당 장르의 평균평점을 조회.출력
db.movies.find().limit(1)

db.movies.aggregate([
  {$unwind: "$genres"},
  {$group:
    {_id: "$genres", avgRating: {$avg: "$imdb.rating"}, sampleTitle: {$first: "$title"}}
  },
  {$sort: {avgRating: -1}},
  {$project: {_id: 1, avgRating: 1, sampleTitle: 1}}
])

// 개봉 연도별 평균 러닝타임이 가장 짧은 영화의 개봉 연도와 평균 러닝타임을 조회.출력
db.movies.aggregate([
  {$group: {_id: "$year", avgRuntime: {$avg: "$runtime"}}},
  {$sort: {avgRuntime: 1}},
  {$limit: 1},
  {$project: {_id: 0, avgRuntime: 1, year: "$_id"}}
])

// 각 국가별 가장 많은 영화를 제작한 감독과 해당 감독이 만든 영화의 수를 출력.
// countries : 국가별 
db.movies.find().limit(1)

db.movies.aggregate([
  {$unwind: "$countries"},
  {$unwind: "$directors"},
  {$group: {
    _id: {country: "$countries", director: "$directors"},
    count: {$sum: 1}}
  },
  {$sort: {count: -1}},
  {$group: {
    _id: "$_id.country",
    topDirector: {$first: "$_id.director"},
    movieCount: {$first: "$count"}
    }
  },
  {$project: {
    _id: 0,
    country: "$_id",
    director: "$topDirector",
    count: "$movieCount"}
  },
  {$sort: {count: -1}}
])

// 연도별 가장 높은 평점을 받은 영화의 제목, 평점을 출력해주세요!
db.movies.aggregate([
  {$sort: {"year": 1, "imdb.rating": -1}},
  {$group: {
    _id: "$year",
    title: {$first: "$title"},
    maxRating: {$first: "$imdb.rating"}
    }
  },
  {$project: {_id: 0, year: "$_id", title: "$title", maxRating: "$maxRating"}},
  {$sort: {year: 1}}
])

// 장르별 영화 갯수 조회.출력

db.movies.aggregate([
  {$unwind: "$genres"},
  {$group: {_id: "$genres", count: {$sum: 1}}},
  {$sort: {count: -1}},
  {$project: {_id: 0, genre: "$_id", movieCount: "$count"}}
])

// 장르별 평균 러닝타임이 가장 긴 장르와 그 장르의 평균 러닝타임 출력하기!
db.movies.find().limit(1)

db.movies.aggregate([
  {$unwind: "$genres"},
  {$group: {_id: "$genres", avgRuntime: {$avg: "$runtime"}}},
  {$sort: {avgRuntime: -1}},
  {$limit: 1},
  {$project: {_id: 0, genres: "$_id", avgRuntime: "$avgRuntime"}}
])

// 각 영화의 제목과 해당 영화에 댓글을 남긴 사용자들을 조회해서 같이 출력해주세요!
db.movies.aggregate([
  {$lookup: {
    from: "comments",
    localField: "_id",
    foreignField: "movie_id",
    as: "movie_comments"
  }},
  {$match: {movie_comments: {$ne: []}}},
  {$project: {_id: 0, title: 1, users: "$movie_comments.name"}}
])

// index 기능
// SQL, NoSQL, SQLD
// -> python > pandas

use test

db.users.find()





