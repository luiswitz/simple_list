# frozen_string_literal: true

require_relative 'collections/base'
require_relative 'collections/basket_items'
require_relative 'collections/receipt_items'

require_relative 'entities/basket_item'
require_relative 'entities/receipt_item'

require_relative 'factories/basket_repository_factory'
require_relative 'factories/receipt_processor_service_factory'
require_relative 'factories/receipt_repository_factory'

require_relative 'receipt'

require_relative 'repositories/basket_repository'
require_relative 'repositories/receipt_repository'

require_relative 'services/receipt_processor_service'
require_relative 'services/tax_calculator_service'

require_relative 'storage/basket_storage'

require_relative 'app'
