const stateShape = {
  entities: {
    images: {
      byId: {
        1: {
          id: 1,
          image_url: 'something.com',
          tagIds: [1]
        },
        2: {
          id: 2,
          image_url: 'something.com',
        }
      },
      ids: [2, 1]
    },
    tags: {
      byId: {
        1: {
          id: 1,
          name: 'themed tag'
        }
      },
      ids: [1]
    }
  },
  session: {}
};
