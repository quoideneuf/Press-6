# frozen_string_literal: true

require "administrate/base_dashboard"

class BookDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    book_id: Field::String,
    title: Field::String,
    subtitle: Field::String,
    sort_title: Field::String,
    isbn: Field::String,
    about_author: Field::Text,
    intro: Field::Text,
    blurb: Field::Text,
    excerpt_image: FileField,
    excerpt_text: TrixField,
    binding: Field::Text,
    description: Field::Text,
    contents: Field::Text,
    author_byline: Field::Text,
    author_bios: Field::Text,
    guide_image: FileField,
    guide_text: TrixField,
    cover_image: FileField,
    format: Field::String,
    ean: Field::String,
    pub_date: Field::String,
    pages_total: Field::String,
    trim: Field::String,
    illustrations: Field::String,
    status: Field::Select.with_options(
      collection: ["In Print", "NP", "OS", "X", "..."]
    ),
    news: Field::Boolean,
    news_text: TrixField,
    newsweight: Field::Select.with_options(
      collection: [1, 2, 3, 4]
    ),
    hot: Field::Boolean,
    hotweight: Field::Select.with_options(
      collection: [1, 2, 3, 4, 5]
    ),
    supplement: Field::String,
    edition: Field::String,
    suggested_reading_image: FileField,
    course_adoption: Field::Boolean,

    series: Field::BelongsTo.with_options(order: "title"),
    catalog: Field::BelongsTo.with_options(order: "title"),
    promotion: Field::BelongsTo.with_options(order: "title"),

    subjects: Field::Text,
    subject1: SubjectsSelectField,
    subject2: SubjectsSelectField,
    subject3: SubjectsSelectField,
    award: Field::String,
    award_year: Field::String,
    award_year2: Field::String,
    award2: Field::String,
    award_year3: Field::String,
    award3: Field::String,
    award_year4: Field::String,
    award4: Field::String,
    price: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    title
    author_byline
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    sort_title
    author_byline
    excerpt_text
    guide_text
    cover_image
    isbn
    ean
    status
    newsweight
    hot
    hotweight
    course_adoption
    catalog
    series
    promotion
    supplement
    edition
    course_adoption
    subject1
    subject2
    subject3
    award
    award_year
    award2
    award_year2
    award3
    award_year3
    award4
    award_year4
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    sort_title
    cover_image
    status
    excerpt_image
    excerpt_text
    edition
    supplement
    subject1
    subject2
    subject3
    catalog
    award
    award_year
    award2
    award_year2
    award3
    award_year3
    award4
    award_year4
    guide_image
    guide_text
    hot
    hotweight
    news
    newsweight
    news_text
    suggested_reading_image
    course_adoption
    promotion
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how books are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(book)
    book.title
  end
end
